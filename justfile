build-all:
    for file in *.typ;\
    do typst compile --pdf-standard=a-2b "$file" output/"${file%.typ}.pdf";\
    done

clean:
    rm output/*.pdf
