function carregar() {
    var msg = window.document.getElementById('msg')
    var img = window.document.getElementById('imagem')
    var data = new Date()
    var hora = data.getHours()
    //var hora = 22

    msg.innerHTML = `Agora são ${hora} horas.`

    if (hora >= 5 && hora < 12){
        img.src = 'manha.png'
        document.body.style.background = '#fbec38'
    } else if (hora >= 12 && hora < 18){
        img.src = 'tarde.png'
        document.body.style.background = '#rgb(111, 255, 142)'
    } else if (hora >= 18 && hora < 20){
        img.src = 'entardecer.png'
        document.body.style.background = '#85332c'
    } else {
        img.src = 'noite.png'
        document.body.style.background = '#111325'
    }
}