%{
#include <stdio.h>
#include <string.h>

void replace_word(const char *old_word, const char *new_word, FILE *input, FILE *output) {
    char buffer[1024];
    while (fgets(buffer, sizeof(buffer), input)) {
        char *pos;
        while ((pos = strstr(buffer, old_word)) != NULL) {
            *pos = '\0';
            fprintf(output, "%s%s", buffer, new_word);
            strcpy(buffer, pos + strlen(old_word));
        }
        fprintf(output, "%s", buffer);
    }
}

%}

%% 
.|\n { ECHO; }

%%

int main(int argc, char **argv) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <old_word> <new_word> <file>\n", argv[0]);
        return 1;
    }

    FILE *input = fopen(argv[3], "r");
    FILE *output = fopen("output.txt", "w");
    if (!input || !output) {
        perror("File opening failed");
        return 1;
    }

    replace_word(argv[1], argv[2], input, output);

    fclose(input);
    fclose(output);
    return 0;
}

int yywrap(){
    return 1;
}