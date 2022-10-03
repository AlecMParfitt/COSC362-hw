# if no argument is specified removes .aux and .log files from the current directory
# if document name is provided, removes only .aux and .log files for that document
#
# usage: pdflatex_cleanup.sh [document_name]
#
# @author: Alec Parfitt

if [ $# -eq 0 ]; then
    rm -f *.aux *.log
else
    rm -f $1.aux $1.log
fi