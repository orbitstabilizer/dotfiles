function pdfmerge(){
    # merge pdf files
    # usage: pdfmerge <output_file> <input_files...>
    # example: pdfmerge output.pdf input1.pdf input2.pdf
    # requires: ghostscript

    if [ -z "$1" ]; then
        echo "Usage: pdfmerge <output_file> <input_files...>"
        return
    fi

    output_file=$1
    shift

    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$output_file $@

    echo "Merged files: $@"
    echo "Output file: $output_file"
}
