class solver {    
    constructor(multiplo, primos){        
        this.multiplo = "calcularTres calcula multiplos de tres y caluclaCinco calcula multiplos de cinco";
    }
    calcularTres(){
        var numeroUno=[];
        for(var i=1;i<=100;i++){
            var resto = i % 3;
            if(resto==0)          
                numeroUno.push(i);
            }
        return numeroUno;
    }    
    calcularCinco(){
        var numeroDos=[];
        for(var i=1;i<=100;i++){
            var resto = i % 5;
            if(resto==0)          
                numeroDos.push(i);
            }
        return numeroDos;
    }
}
