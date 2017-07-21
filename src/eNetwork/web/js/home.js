
function trim(str)
{

    while(str.substring(0,1)==' ')
    {
        str=str.substring(1,str.length);
    }
    while(str.substring(str.length-1,str.length)==' ')
    {
        str=str.substring(0,str.length-1);
    }
    return str;
}
function insert_post()
{
    var share_content=trim(document.getElementById("share_content").value);
    if(share_content=="")
    {
        return false;
    }
    var node=document.createElement("div");
    node.setAttribute("id", "post_row");
    node.setAttribute("class", "post_row");

    //Ajax
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/insert_post.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("share="+share_content);
    var rsp=null;
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
          node.innerHTML=xhr.responseText;
        }
    }

    var nd=document.getElementById("post");
    var ref=document.getElementById("post_row");
    nd.insertBefore(node, ref);
    document.getElementById("share_content").value="";
    return true;
}
function remove_post(psid,elem)
{
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/remove_post.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("psid="+psid);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
            
            var cnodes=elem.childNodes;
    var ccnodes=cnodes[9].childNodes;
    var node=document.getElementById("post");
    node.removeChild(elem);
        }
    }
}
function hide_post(psid,elem)
{
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/hide_post.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("psid="+psid);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
            var cnodes=elem.childNodes;
    var ccnodes=cnodes[9].childNodes;
    var node=document.getElementById("post");
    node.removeChild(elem);
        }
    }
}
function show_comment_box(elem)
{
    var cnodes=elem.childNodes;
    cnodes[9].style.display="block";
    var ccnodes=cnodes[9].childNodes;
    ccnodes[1].focus();
}
function hide_comment_box_auto(elem)
{
    var ct=document.getElementById("comment_text").value;
    if(ct=="")
        {
            var cnodes=elem.childNodes;
    cnodes[9].style.display="none";
        }
}
function hide_comment_box(elem)
{
    var cnodes=elem.childNodes;
    cnodes[9].style.display="none";
}
function insert_comment(elem)
{
    var cnodes=elem.childNodes;
    var ccnodes=cnodes[9].childNodes;
    var comment_content=trim(ccnodes[1].value);
    var psid=trim(ccnodes[3].value);
    if(comment_content=="")
    {
        return false;
    }
    var node=document.createElement("div");
    node.setAttribute("id", "comment_row");
    node.setAttribute("class", "comment_row");

    //Ajax
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/insert_comment.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("comment="+comment_content+"&psid="+psid);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
            node.innerHTML=xhr.responseText;
        }
    }
    var nd=cnodes[7];
    var chnodes=nd.childNodes;
    var ref=chnodes[chnodes.length];
    nd.insertBefore(node, ref);
    hide_comment_box(elem);
    ccnodes[1].value="";
    return true;
}
function remove_friend(uid)
{

    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/remove_friend.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("uid="+uid);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
           document.getElementById("friend_status").innerHTML="<a class='link' id='friend_status' onclick='send_friend_request("+uid+")'>Send Friend Request</a>";
            
        }
    }
}
function cancel_friend_request(uid)
{

    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/cancel_friend_request.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("uid="+uid);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
            document.getElementById("friend_status").innerHTML="<a class='link' id='friend_status' onclick='send_friend_request("+uid+")'>Send Friend Request</a>";
        }
    }
}
function send_friend_request(uid)
{
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/send_friend_request.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("uid="+uid);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
            document.getElementById("friend_status").innerHTML="Friend Request Sent.<br><a class='link' id='friend_status' onclick='cancel_friend_request("+uid+")'>Cancel Friend Request</a>";
        }
    }
}
function accept_friend_request(uid,elem)
{
    var node;
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/accept_friend_request.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("uid="+uid);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
            node=document.getElementById("friend_request");
            node.removeChild(elem);
        }
    }
    
}
function discard_friend_request(uid,elem)
{
    var node;
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/discard_friend_request.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("uid="+uid);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
            node=document.getElementById("friend_request");
            node.removeChild(elem);
        }
    }

}

function load_result(last,search)
{
    var search_row=document.createElement("div");
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/load_result.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("search="+search+"&last="+last);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
            search_row.innerHTML=xhr.responseText;
        }
    }
     document.getElementById("search").appendChild(search_row);
     last=last+10;
     document.getElementById("load_result").setAttribute("onclick", "load_result("+last+",'"+search+"')");
}
function add_field_photo()
{
    var image_table=document.getElementById("image_table");
    var ref=document.getElementById("image_row");
    var tr=document.createElement("tr");
    tr.setAttribute("align", "center");
    tr.setAttribute("id", "image_row");

    var td=document.createElement("td");
    tr.appendChild(td);
    td.innerHTML='<input type="file" name="image" id="image" size="21"/>';
    image_table.insertBefore(tr, ref);
    
}
function add_field_video()
{
    var video_table=document.getElementById("video_table");
    var ref=document.getElementById("video_row");
    var tr=document.createElement("tr");
    tr.setAttribute("align", "center");
    tr.setAttribute("id", "video_row");
    var td=document.createElement("td");
    tr.appendChild(td);
    td.innerHTML='<input type="file" name="video" id="video" size="21"/>';
    video_table.insertBefore(tr, ref);

}
function send_friend_request_search(uid,elem)
{
    var cnodes=elem.childNodes;
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/send_friend_request.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("uid="+uid);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
            cnodes[1].innerHTML="Friend Request Sent.<br><a class='link' id='friend_status' onclick='cancel_friend_request_search("+uid+","+elem+")'>Cancel Friend Request</a>";
        }
    }
}
function remove_friend_search(uid,elem)
{
    var cnodes=elem.childNodes;
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/remove_friend.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("uid="+uid);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
           cnodes[1].innerHTML="<a class='link' id='friend_status' onclick='send_friend_request_search("+uid+","+elem+")'>Send Friend Request</a>";

        }
    }
}
function cancel_friend_request_search(uid,elem)
{
    var cnodes=elem.childNodes;
    if(window.XMLHttpRequest)
    {
        xhr=new XMLHttpRequest();
    }
    else
    {
        xhr=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhr.open("POST","ajax/cancel_friend_request.jsp",true);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhr.send("uid="+uid);
    xhr.onreadystatechange=function()
    {
        if (xhr.readyState==4 && xhr.status==200)
        {
            cnodes[1].innerHTML="<a class='link' id='friend_status' onclick='send_friend_request_search("+uid+",this.parentNode.parentNode)'>Send Friend Request</a>";
        }
    }
}