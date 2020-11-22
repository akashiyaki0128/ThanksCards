 function saveBtn(){

  const TellSaved = document.getElementById("save-btn")

  TellSaved.addEventListener('click', function() {
    this.setAttribute("style", "background-color: black ;")
    this.setAttribute("data-disable-with", "変更を保存しました");
  })
}

window.addEventListener('load', saveBtn)