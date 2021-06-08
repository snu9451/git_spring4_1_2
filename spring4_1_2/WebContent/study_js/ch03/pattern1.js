// 제공 함수를 통한 패턴 분석1
{
  // console.log('test0');
  'use strict'
  let addNum = 0;
  let subNum = 100;

  // 선언(?)만으로도 호출이 되는 듯. 호출 없이도 실행이 되고 있다.
  const auto_1 = setInterval(function(){
    addNum++;
    console.log("addNum: "+addNum);
  }, 3000);
  const auto_2 = setInterval(function(){
    subNum--;
    console.log("addNum: "+addNum);
  }, 3000);
}