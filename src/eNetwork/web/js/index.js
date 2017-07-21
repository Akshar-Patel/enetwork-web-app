function validate_required(field)
{
with (field)
  {
  if (value==null||value=="")
    {
    field.style.border="2px solid #FF3A13"
    document.getElementById("error").innerHTML="enter "+name;
    return false; 
    }
  else
    {
    document.getElementById("error").innerHTML="";
    return true;
    }
  }
}
function validate_form(thisform)
{
with (thisform)
  {
  
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


