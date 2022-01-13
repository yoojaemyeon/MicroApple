var character =
document.getElementById("character")
var block = document.getElementById("block");
function jump(){
    if(character.classList != "animate"){
        character.classList.add("animate");
    }
    setTimeout(function(){
        character.classList.remove("animate");
    },500);
}


var checkDead = setInterval(function(){
    var characterTop =
    parseInt(window.getComputedStyle(character).
    getPropertyValue("top"));

    var blockLeft =
    parseInt(window.getComputedStyle(block).getPropertyValue("left"));
    if (blockLeft<20 && blockLeft>0 && characterTop>=130) {
        block.style.animation = "none";
        block.style.display = "nine";
        alert("[에러 페이지] microApple 블록 한번 더 도전!")
    }

},10);