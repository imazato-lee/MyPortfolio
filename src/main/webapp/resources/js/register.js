
/* SECTION - ID */
let idRegExp = /^[a-zA-Z0-9]{6,20}$/;
let inputId = ""
let duplicationChecked = false;
let isIdValid = false;
$(document).ready(function() {
    $("#idInput").on("change", function() {
        inputId = $("#idInput").val();
        if (idRegExp.test(inputId)) {
            $("#idMsg").text("사용 가능한 아이디입니다.");
            $("#idMsg").css("color", "green");
            isIdValid = true;
            console.log("id: " + inputId)
        } else {
            $("#idMsg").text("6~20자의 영문 소문자와 숫자만 사용 가능합니다.");
            $("#idMsg").css("color", "red");
            isIdValid = false;
            return;
        }
    });

    $("#id-check").click(function(){
        if(!idRegExp.test(inputId)){
            alert("유효한 아이디를 입력해주세요.")
            return;
        }
        let id = $("#idInput").val()

        $.ajax({
            url : "/user/" + id,
            type : "GET",
            dataType : "text",
            success : function(response){
                if(response === "duplicate"){
                    $("#idInput").val("")
                    $("#idMsg").text("이미 존재하는 아이디입니다. 다시 입력해주세요.");
                    $("#idMsg").css("color", "red");
                    $("#idInput").focus()
                    duplicationChecked = false;
                } else {
                    if (!confirm('사용 가능한 아이디입니다. 이 아이디로 가입하시겠습니까?')) {
                        $("#idInput").attr('readOnly',false)
                        return;
                    } else {
                        duplicationChecked = true;
                        console.log(duplicationChecked)
                    }
                    $("#idInput").attr('readOnly','readOnly')
                }
            },
            error : function() { alert("에러가 발생하였습니다. 관리자에게 문의해주세요.")},
        })
    })

    /* SECTION - PASSWORD */
    // pw: 패스워드 pwRe: 패스워드 재입력 isPwValid: 패스워드 유효 여부
    let pw = "", pwRe = "", isPwValid = false;
    $("#pwdInput").change(function(){
        let pwRegExp = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
        pw = $("#pwdInput").val()
        console.log(pw)
        if(pwRegExp.test(pw)){
            $("#pwMsg").text('');
        } else {
            $("#pwMsg").text('8~20자의 영문, 숫자, 특수문자를 모두 포함한 비밀번호를 입력해주세요.')
        }
    })

    /* SECTION - PASSWORD RECHECK */
    $("#pwdCheckInput").on("input",function(){
        pwRe = $("#pwdCheckInput").val()
        if (pw === pwRe){
            $("#pwConfirmMsg").css("color","green")
            $("#pwConfirmMsg").text("비밀번호가 일치합니다")
            console.log("pw: " + pw + "pwRe: " + pwRe )
            isPwValid = true;
        } else {
            $("#pwConfirmMsg").css("color","red")
            $("#pwConfirmMsg").text("비밀번호가 일치하지 않습니다")
            isPwValid = false;
        }
    })
    /* SECTION - NAME */
    let name=""
    let isNameValid = false;
    $("#nameInput").change(function(){
        let nameRegExp = /^[A-Za-z가-힣]+$/;
        name = $("#nameInput").val()
        if(nameRegExp.test(name)){
            $("#namelMsg").text("")
            console.log("name: " + name)
            isNameValid = true;
        } else {
            $("#namelMsg").css("color","red")
            $("#namelMsg").text("올바른 값이 아닙니다. 다시 시도해주세요")
            isNameValid = false;
        }
    })
    /* SECTION - EMAIL */
    let email= ["",""];
    let isEmailValid = false;
    function checkEmailValid(){
        if(email[0] !=="" && email[1] !==""){
            console.log(email[0]+"@"+email[1])
            $("input[name=email]").val(email[0]+"@"+email[1])
            isEmailValid = true;
        } else {
            $("input[name=email]").val("")
            isEmailValid = false;
        }
    }
    $("#email-txt").change(function(){
        email[0] = $(this).val()
        console.log("email[0]: " + email[0])
        checkEmailValid()
    })
    //도메인을 직접 입력하는 경우
    $("#domain-txt").change(function(){
        email[1] = $(this).val()
        console.log("email[1]: " + email[1])
        checkEmailValid()
    })
    //도메인을 선택하는 경우
    $("#domain-list").change(function(){
        let domainSelected = $(this).val();
        console.log("domainSelected: " + domainSelected)
        if(domainSelected !== "type"){
            $("#domain-txt").val(domainSelected)
            $("#domain-txt").attr("disabled",true)
            email[1] = domainSelected
        } else {
            $("#domain-txt").val("")
            $("#domain-txt").attr("disabled",false)
            email[1] = ""
        }
        checkEmailValid()
    })

    /* SECTION - BIRTH */
    let birthArr = ["","",""];
    /* 유효한 날짜인지 여부 확인 (윤년/평년) */
    function checkBirthValid(birthArr) {
        isBirthValid = true
        y = birthArr[0]
        m = birthArr[1]
        d = birthArr[2]
        // 생년월일 모두 선택 완료 시
        if(y > 0 && m > 0 && d > 0) {
            if ((m == 4 || m == 6 || m == 9 || m == 11) && d == 31) {
                isBirthValid = false
            }
            else if (m == 2) {
                if(((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0)) { // 윤년
                    if(d > 29) { // 윤년은 29일까지
                        isBirthValid = false
                    }
                } else { // 평년
                    if(d > 28) { // 평년은 28일까지
                        isBirthValid = false
                    }
                }
            }
        }
        if(isBirthValid) { // 유효한 날짜
            $("#birthMsg").text("")

            let birth = birthArr.join('-')
            console.log("birth: " + birth)
            $('input[name=birth]').val(birth)
        } else { // 유효하지 않은 날짜
            $("#birthMsg").text("생년월일을 다시 확인해주세요")
            $('input[name=birth]').val('')
        }

    }
    /* 년 */
    $("#year").change(function(){
        let yearRegExp = /^\d{4}$/;
        let year = $("#year").val()
        console.log('year: ' + year)
        if(yearRegExp.test(year) && year > 1850){
            $("#birthMsg").text("")
            birthArr[0] = year
            checkBirthValid(birthArr)
        } else {
            $("#birthMsg").text("태어난 년도 4자리를 정확하게 입력하세요.")
        }
    })

    /* 월 */
    $("#month").change(function(){
        let month = $("#month").val()
        if(month < 10){
            month = "0" + month;
        }
        birthArr[1] = month
        console.log("month: " + birthArr[1])
        checkBirthValid(birthArr)
    })

    /* 일 */
    $("#day").change(function(){
        let day = $("#day").val()
        console.log("day: "+day);
        if(!(day > 0 && day < 32)){
            $("#birthMsg").text("태어난 날을 정확하게 입력하세요.")
            return;
        }

        if (day < 10) {
            day = "0" + day;
        }

        birthArr[2] = day
        checkBirthValid(birthArr)

    })



    /* SECTION - MOBILE */
    let mobile=""
    let isMobileValid = false;
    $('#mobile').change(function(){
        let mobileRegExp = /^010([0-9]{8})$/;
        mobile = $('#mobile').val()

        if(mobileRegExp.test(mobile)){
            $("#mobilelMsg").text("")
            isMobileValid = true;
            console.log("mobile: " + mobile)
        } else {
            $("#mobilelMsg").css("color","red")
            $("#mobilelMsg").text("‘-’을 제외한 11자리 숫자를 입력해주세요")
            isMobileValid = false;
        }
    })
    /* SECTION - SUBMIT */
    $('#submit').on("click",function(){

        if(!isIdValid){
            alert("아이디를 확인하세요.")
            return
        } else if(!duplicationChecked){
            alert("아이디 중복확인은 필수입니다.")
        } else if(!isPwValid){
            alert("비밀번호를 확인하세요.")
            return
        } else if(!isNameValid){
            alert("이름을 확인해주세요.")
            return
        } else if(!isMobileValid){
            alert("연락처를 확인해주세요.")
            return
        } else if(!isBirthValid){
            alert("생년월일을 확인해주세요.")
            return
        } else if (!$('#agree_service_check').is(':checked')) {
            alert("이용약관 동의는 필수입니다.")
            return
        } else if (!$('#agree_privacy_check').is(':checked')){
            alert("개인정보 수집 및 이용의 동의는 필수입니다.")
            return
        }
        let form = $("#registerForm")
        form.submit();
    })
});
