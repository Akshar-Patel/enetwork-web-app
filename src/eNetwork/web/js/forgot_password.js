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
            document.getElementById("error").innerHTML="Enter email.";
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
            return false;
        }
        else {
            return true;
        }
        }
}

function validate_form(thisform)
{
    with (thisform)
    {
        
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
   
        }
}

