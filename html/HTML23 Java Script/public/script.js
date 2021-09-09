/* Comentário
em
bloco */

//alert("Hello World!");

// Comentário em linha

/*
alert("Olá Mundo!");

var mensagem = "Olá Mundo!!!";
alert(mensagem);

var a = 2;
var b = 3;
var soma = a+b;
var sub = a-b;
var mult = a*b;
var div = a/b;
alert(soma);
alert(sub);
alert(mult);
alert(div);

var c = "Olá Mundão!!";

if (c%2 == 0) {
	alert("Número par");
}else if (c%2 == 1) {
	alert("Número ímpar");
}else{
	alert("Valor inválido");
}


var x = 0;
while(x<3){
	alert(x);
	x++;
}

for (var y = 0; y < 5; y++) {
	alert(y);
}


var lista = ["laranja","mamão","uva","pêra",1234];
//alert (lista[1]);
for(x in lista){
//	alert(x);
	alert(lista[x]);
}

console.log("Xereta!!");


----- Função -----

function soma(a,b){
	console.log(a+b);
}
soma(5,15);


function subtracao(a, b){
	return a-b;
}
var s = subtracao(5, 3);
console.log(s);


function multiplicacao(a, b){
	return a*b;
}
console.log(multiplicacao(5,100));


----- Eventos -----

1
function mensagem(){
	alert("Ei não clique em mim!!");
}

2
function mensagem(nome){
	alert("Ei não clique em mim "+nome);
}

3
function mensagem(nome){
	alert("Ei não clique em mim "+nome);
}

4
function mensagem(nome){
	alert("Ei volte aqui "+nome);
}

	----- DOM -----
function mudaCor(cor){
	var elemento = document.getElementById("mensagem");
	elemento.style.color = cor;
}

	----- Validação de formulario ----- */
function valida(){
	var nome = document.getElementById('nome');

	if (nome.value=="") {
		aletr("Campo não pode estar em branco.");
	}
	else{
		alert("Nenhum problema foi detectado. Seu formulário pode ser enviado com sucesso.");
	}
}




















