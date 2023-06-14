package com.myportfolio.web.controller;

import com.myportfolio.web.domain.AttachFileDto;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
public class UploadController {

    private String getFolder(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        return str.replace("-", File.separator);
    }

    //이미지 파일인지 아닌지 검사
    private boolean checkImageType(File file){
        try {
            String contentType = Files.probeContentType(file.toPath());
            return contentType.startsWith("image");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    //파일 업로드
    @PostMapping( value = "/uploadFileAjax", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<AttachFileDto>> uploadFileAjax(MultipartFile[] uploadFile){
        List<AttachFileDto> list = new ArrayList<>();
        String uploadFolder = "/Users/sehyeon/upload";

        String uploadFolderPath = getFolder();
        File uploadPath = new File(uploadFolder, uploadFolderPath);

        if(uploadPath.exists() == false){
            uploadPath.mkdirs();
        }

        for(MultipartFile multipartFile : uploadFile){
            AttachFileDto attachDto = new AttachFileDto();
            String uploadFileName = multipartFile.getOriginalFilename();
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1);
            attachDto.setFileName(uploadFileName);
            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName;

            try {
                File saveFile = new File(uploadPath, uploadFileName);
                multipartFile.transferTo(saveFile);

                attachDto.setUuid(uuid.toString());
                attachDto.setUploadPath(uploadFolderPath);

                if(checkImageType(saveFile)){
                    attachDto.setImage(true);
                    FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
                    Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
                    thumbnail.close();
                }
                // add to list
                list.add(attachDto);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } // end for
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    //업로드한 파일 보여주기
    @GetMapping( value = "/display" , produces = MediaType.IMAGE_JPEG_VALUE)
    public ResponseEntity<byte[]> getFile(String fileName){
        File file = new File("/Users/sehyeon/upload/" + fileName);

        ResponseEntity<byte[]> result = null;

        try {
            HttpHeaders header = new HttpHeaders();
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    //파일 삭제하기
    @DeleteMapping( value = "/deleteFile" , consumes = "application/json")
    public ResponseEntity<String> deleteFile(@RequestBody Map<String, String> param){
        String fileName = param.get("fileName");
        String type = param.get("type");

        File file;
        try {
            file = new File("/Users/sehyeon/upload/" + URLDecoder.decode(fileName, "UTF-8"));
            file.delete();
            if(type.equals("image")){
                String largeFileName = file.getAbsolutePath().replace("s_","");
                file = new File(largeFileName);
                file.delete();
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>("delete", HttpStatus.OK);
    }
}
