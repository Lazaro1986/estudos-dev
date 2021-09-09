function parimpar(n) {
    if (n % 2 == 0) {
        return 'Par'
    } else {
        return 'Ímpar'
    }
}
let res = parimpar(8)
console.log(res)
// ou pode se assim também:
console.log(parimpar(5))

console.log('I_______________')

function soma(n1, n2){
    return n1 + n2
}

console.log(soma(2, 5))

console.log('II______________')

// Caso não receba um dos parâmetros:
function soma2(n1=0, n2=0) {
    return n1 + n2
}

console.log(soma2(3))

console.log('III_____________')

// Variável recebendo uma função:
let v = function(x) {
    return x * 2
}
console.log(v(5))

console.log('IV______________')

// Calculando o fatorial de um número:
// exemplo: (cinco fatorial) 5! = 5 x 4 x 3 x 2 x 1 = 120
function fatorial(n) {
    let fat = 1
    for(let c = n; c > 1; c--) {
        fat *= c
    }
    return fat
}
console.log(fatorial(5))

// Recursividade de função, uma função chama ela mesma dentro dela
function fatorial2(n) {
    if(n == 1) {
        return 1
    } else {
        return n * fatorial2(n-1)
    }
}
console.log(fatorial2(5))