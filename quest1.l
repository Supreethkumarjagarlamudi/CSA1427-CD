
%%
[A-Z]+[\t\n ] {
	printf("%s is a capital word \n", yytext);
}
.  ;
%%

int main(){
	printf("Enter String: ");
	yylex();
}

int yywrap(){
	return 1;
}