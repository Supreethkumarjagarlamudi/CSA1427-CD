%{
#include <stdio.h>
%}

%%

[aeiouAEIOU].* {
    printf("Accepted: %s\n", yytext);
}

.|\n {
    printf("Rejected: %s\n", yytext);
}

%%

// Main function
int main() {
    yylex(); // Start the lexical analysis
    return 0;
}

int yywrap(){
    return 1;
}

// Error handling
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}