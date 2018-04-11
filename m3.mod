/*********************************************
 * OPL 12.7.1.0 Model
 * Author: seifeddine
 * Creation Date: Apr 26, 2017 at 9:49:06 AM
 *********************************************/
{string} tasks=...;
tuple taskdata
	 {
	int p;
	int w;
	int r;
		}
					
taskdata task[tasks]=...;


int sum_of_all_p=sum (i in tasks)(task[i].p);



dvar int+ x[tasks];
dvar int+ y[tasks];
dvar int c[tasks];
dvar int+ a[tasks][tasks];
dvar int+ b[tasks][tasks];
dvar int+ pf1;
dvar int+ pf2;
dvar int+ DF1;
dvar int+ DF2;



minimize 
	sum(j in tasks)(task[j].w*c[j] ) ;
	
subject to {


forall(i,j in tasks: i != j)     ct1: 
( a[i][j]+a[j][i]+b[i][j]+b[j][i]>= 1 ); 

 forall(i,j in tasks: i != j)    ct2: 
 ( x[j]>= x[i]+1-2*( 1-a[i][j]) );
  
 forall(i,j in tasks: i != j)    
 ct3:  (y[j]>=y[i]+task[i].p - sum_of_all_p *(1-b[i][j])) ;
   

forall(i in tasks)       
ct5: (y[i]>=task[i].r); 

forall(i in tasks)		 
ct6: (c[i]>= y[i]+task[i].p)  ;

forall(i,j in tasks)
  ct7: (a[i][j]<=1 );
  
  forall(i,j in tasks)
  ct8: (b[i][j] <=1);
 
forall(i in tasks)		 
ct9: (y[i]>= pf1 - sum_of_all_p * x[i] )  ; 
 
forall(i in tasks)		 
ct10: (y[i]>= pf2 - sum_of_all_p * (1-x[i]) )  ; 
  
forall(i in tasks)
  ct11: (DF1>= y[i]+task[i].p-sum_of_all_p*x[i]);
   
forall(i in tasks)
  ct12: (DF2>= y[i]+task[i].p-sum_of_all_p*(1-x[i]));   
  
DF1-pf1==sum(i in tasks)(task[i].p*(1-x[i]));  
DF2-pf2==sum(i in tasks)(task[i].p*x[i]);     
 
   }