/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function validate_required(field)
{
    with (field)
    {
        if (value==null||value=="")
        {
            field.style.border="2px solid #FF3A13";
            document.getElementById("error").innerHTML="Fill out all the required fields.";
            window.scrollTo(0, 0);
            return false;
        }
        else
        {
            document.getElementById("error").innerHTML="";
            return true;
        }
        }
}
function validate_email(field)
{
    with (field)
    {
        apos=value.indexOf("@");
        dotpos=value.lastIndexOf(".");

        if ((apos<1)||(dotpos-apos<2))
        {
            field.style.border="2px solid #FF3A13";
            document.getElementById("error").innerHTML="Enter valid email.";
            window.scrollTo(0, 0);
            return false;
        }
        else {
            return true;
        }
        }
}
function match(field1,field2)
{
    if(field1.value==field2.value)
    {
        return true;
    }
    else
    {
        field1.style.border="2px solid #FF3A13";
        document.getElementById("error").innerHTML="Passwords do not match. Enter again.";
        window.scrollTo(0, 0);
        return false;
    }
}
function check_tc(field)
{
    if(field.checked)
        {
            return true;
        }
    else
        {
             field.style.border="2px solid #FF3A13";
             document.getElementById("error").innerHTML="You must accept terms and conditions to proceed.";
             window.scrollTo(0, 0);
             return false;
        }
}
function validate_form(thisform)
{
    with (thisform)
    {
        
        if (validate_required(first_name)==false)
        {
            first_name.focus();
            return false;
        }
        if (validate_required(last_name)==false)
        {
            last_name.focus();
            return false;
        }
        if (validate_required(username)==false)
        {
            username.focus();
            return false;
        }
        if (validate_required(password)==false)
        {
            password.focus();
            return false;
        }
        if (validate_required(confirm_password)==false)
        {
            confirm_password.focus();
            return false;
        }
        if(match(password,confirm_password)==false)
        {
            password.value="";
            confirm_password.value="";
            password.focus();
            return false;
        }
         if (validate_required(email)==false)
        {
            email.focus();
            return false;
        }
        if (validate_email(email)==false)
        {
            email.focus();
            return false;
        }
        if(check_tc(tc)==false)
            {
                //tc.focus();
                return false;
            }
        }


}
function validate(field)
{
    with(field)
    {

        if(value==""||value==null)
        {

        }
        else
        {
            field.style.border="2px solid #5FBD4F";
        }
        }
}
function trimn(str)
{
    while(str.substring(0,1)==' ' || str.substring(0,1)=='\n')
    {
        str=str.substring(1,str.length);
    }
    while(str.substring(str.length-1,str.length)==' ' || str.substring(str.length-1,str.length)=='\n')
    {
        str=str.substring(0,str.length-1);
    }
    return str;
}
function check_username()
{
    var username=document.getElementById("username").value;
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/check_username.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("username="+username);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
            if(trimn(xhr.responseText)=="no")
                {
                    document.getElementById("error").innerHTML=username+" username is not availabe.";
                    document.getElementById("username").focus();
                    document.getElementById("username").value="";
                }
                else
                    {
                     document.getElementById("error").innerHTML="";
                    }
        }
    }
}
function check_email()
{
    var email=document.getElementById("email").value;
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/check_email.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("email="+email);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
            if(trimn(xhr.responseText)=="no")
                {
                    document.getElementById("error").innerHTML=email+" is already registerd.";
                    document.getElementById("email").focus();
                    document.getElementById("email").value="";
                }
                else
                    {
                     document.getElementById("error").innerHTML="";
                    }
        }
    }
}