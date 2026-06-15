class TablaTangente {
   public static double seno(double x, int n) {
       double sumaSeno = 0.0;
       for (int i = 0; i < n; i++) {
           int exponente = (2 * i) + 1;
           double potencia = Math.pow(x, exponente);


           double factorial = 1.0;
           for (int j = 1; j <= exponente; j++) {
               factorial *= j;
           }
           double termino = potencia / factorial;
           if (i % 2 == 0) {
               sumaSeno += termino;
           } else {
               sumaSeno -= termino;
           }
       }
       return sumaSeno;
   }
    public static void main(String[] args) {
       int terminos = 10;
       double incremento = Math.PI / 8;


       System.out.println("Angulo (rad)\t\tTangente");
       System.out.println("----------------------------------------");
       for (double x = 0; x <= (2 * Math.PI) + 0.0001; x += incremento) {
           double valorSeno = seno(x, terminos);
           double valorCoseno = Math.sqrt(Math.abs(1.0 - (valorSeno * valorSeno)));
           if (x > (Math.PI / 2) + 0.001 && x < (3 * Math.PI / 2) - 0.001) {
               valorCoseno = -valorCoseno;
           }


           System.out.print(Math.round(x * 1000.0) / 1000.0 + "\t\t\t");
           if (Math.abs(valorCoseno) < 1e-5) {
               System.out.println("infinito");
           } else {
               double tangente = valorSeno / valorCoseno;
               double tangenteCorta = Math.round(tangente * 10000.0) / 10000.0;
               System.out.println(tangenteCorta);
           }
       }
   }
}
