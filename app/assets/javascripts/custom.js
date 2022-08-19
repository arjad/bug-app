function yourOnChangeHandler()
{
    console.log("vlaue changed")
    
    // select last option value from select option
    var o = $("select[name='bug[status]']")[0][2]
    console.log("obj = " , o.value)

    //select value of selected option in selct tag
    bt = $("#type").find(':selected').val();
    
    if(bt == "bug")
      {
        console.log("its bug");
        o.value="resolved"
        o.text="resolved"
      }
    else if (bt == "feature")
      {
        console.log("its feature");
        o.value ="completed"
        o.text = "completed"
    }
    

}