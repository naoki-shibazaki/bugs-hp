// https://codepen.io/manabox/pen/NWqJMQZ
const btn = document.querySelector('.btn-menu');
const btn2 = document.querySelector('.btn-account');
const nav = document.querySelector('nav');
const nav2 = document.querySelector('nav2');

if(btn){
  btn.addEventListener('click', () => {
    nav.classList.toggle('open-menu')
    // if (btn.innerHTML === 'メニュー') {
    //   btn.innerHTML = '閉じる';
    // } else {
    //   btn.innerHTML = 'メニュー';
    // }
    // ↑ これと同じ意味の三項演算子での書き方 ↓
    btn.innerHTML = btn.innerHTML === 'メニュー'
      ? '閉じる'
      : 'メニュー'
  });
}

if(btn2){
  btn2.addEventListener('click', () => {
    nav2.classList.toggle('open-menu')
    btn2.innerHTML = btn2.innerHTML === 'アカウント'
      ? '閉じる'
      : 'アカウント'
  });
}