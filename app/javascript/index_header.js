$(function(){
  let tabs = $(".firstMenu__parents ")
  tabsAry = Array.prototype.slice.call(tabs);
  function tabOver(){
    console.log(this)
    // if ($(".firstMenu__parents--parent").length !=0){
    //   $(".firstMenu__parents--parent")[0].classList.remove("firstMenu__parents--parent")
    // }
    
  }
  tabs.mouseover(tabOver)

});