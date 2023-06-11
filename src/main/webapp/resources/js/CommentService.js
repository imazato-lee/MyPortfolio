class CommentService{

    //댓글 등록하기
    static add(comment,callback,error){
        console.log("add")
        $.ajax({
            type : 'post',
            url : '/comments/new',
            data : JSON.stringify(comment),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr){
                if(callback){
                    callback(status)
                }
            },
            error : function(xhr, status, er){
                if(error){
                    error(xhr.status + ' ' + status)
                }
            }
        })
    }

    //notice번호에 해당하는 댓글 전체 가져오기
    static getList(param,callback,error){
        let nno = param.nno
        $.getJSON('/comments/'+nno,
            function(data){
                if(callback){
                    console.log(data)
                    callback(data)
                }
            }).fail(function(xhr, status, er){
                if(error){
                    error(xhr.status + ' ' + status);
                }
        })
    }

    //댓글 업데이트
    static update(comment,callback,error){
        console.log("update")
        $.ajax({
            type : 'patch',
            url  : '/comments/' + comment.cno,
            data : JSON.stringify(comment),
            contentType: "application/json; charset=utf-8",
            success : function(updateResult, status, xhr){
                if(callback){
                    callback(updateResult)
                }
            },
            error : function(xhr, status, er){
                if(error){
                    error(er)
                }
            }
        })
    }

    //댓글 삭제
    static remove(comment,callback,error){
        $.ajax({
            type : 'delete',
            url : '/comments/' + comment.cno,
            data : JSON.stringify(comment),
            contentType: "application/json; charset=utf-8",
            success : function(deleteResult, status, xhr){
                if(callback){
                    callback(deleteResult)
                }
            },
            error : function(xhr, status, er){
                if(error){
                    error(er)
                }
            }
        })
    }

    //시간 처리
    static displayTime(timeValue){
        let today = new Date()
        let gap = today.getTime()-timeValue
        let dateObj = new Date(timeValue)
        let str = ""
        if(gap < ( 1000 * 60 * 60 * 24)){
            let hh = dateObj.getHours()
            let mi = dateObj.getMinutes()
            let ss = dateObj.getSeconds()
            return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('')
        } else {
            let yy=dateObj.getFullYear()
            let mm = dateObj.getMonth()
            let dd = dateObj.getDay()
            return [yy, '/' , (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('')
        }
    }


}