// https://codepen.io/manabox/pen/NWqJMQZ
const btn = document.querySelector('.btn-menu');
const btn2 = document.querySelector('.btn-account');
const nav = document.querySelector('nav');
const nav2 = document.querySelector('nav2');

if(btn){
  btn.addEventListener('click', () => {
    if(btn2){ if(btn2.innerHTML === '閉じる'){ return false; } }
    nav.classList.toggle('open-menu')
    btn.innerHTML = btn.innerHTML === 'メニュー'
      ? (v => {menu_btn_change(2, false); menu_btn_change(3, false); return '閉じる';})()
      : (v => {menu_btn_change(2, true); menu_btn_change(3, true); return 'メニュー';})()
  });
}

if(btn2){
  btn2.addEventListener('click', () => {
    if(btn.innerHTML === '閉じる'){ return false; }
    nav2.classList.toggle('open-menu')
    btn2.innerHTML = btn2.innerHTML === 'アカウント'
      ? (v => {menu_btn_change(1, false); menu_btn_change(3, false); return '閉じる';})()
      : (v => {menu_btn_change(1, true); menu_btn_change(3, true); return 'アカウント';})()
  });
}

// メニューボタンの表示・非表示切り替え
menu_btn_change = (btn_pos_num, show_flag) => {
  const selecter = '.pulse-btn.position' + btn_pos_num
  if(show_flag === true){
    fadeProc(selecter, 0, 'In');
  }else{
    fadeProc(selecter, 0, 'Out');
  }
}