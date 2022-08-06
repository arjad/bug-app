

function yourOnChangeHandler()
{
    console.log("chnaged mthod")
    
    // select last option value from select option
    var o = $("select[name='bug[status]']")[0][2]
    console.log("obj = " , o.value)

    if(o.value === "bug")
      {
        console.log("its bug");
        o.value="resolved"
        o.text="resolved"
      }
    else if (o.value === "feature")
      {
        console.log("its feature");

      obj.value ="completed"
      o.text = "completed"
    }
    

}