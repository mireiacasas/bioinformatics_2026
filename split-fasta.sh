#!/bin/bash

# Split a multi-FASTA file into individual FASTA files

# $1 = input multi-FASTA file
# $2 = output directory (optional)

# If no output directory is provided,
# use "split_fastas" as the default.
outdir=${2:-split_fastas}

# Create the output directory if it does not exist.
mkdir -p "$outdir"

# Run AWK on the input FASTA file.
# -v passes the Bash variable "outdir" to AWK.
awk -v outdir="$outdir" '

# If the current line starts with ">"
# it is a FASTA header.
/^>/ {

    # Remove the leading ">" from the header.
    # Example:
    # >Homo_sapiens_INS
    # becomes:
    # Homo_sapiens_INS
    #
    # Then create the corresponding output filename.
    file = outdir "/" substr($0,2) ".fasta"
}

# This block is executed for every line.
{

    # Write the current line to the current output file.
    print > file
}

# End of AWK program

' "$1"

# "$1" is the first command-line argument.
# It specifies the input multi-FASTA file to read.
#
# Example:
# ./split_fasta.sh insulin.fasta output_dir
#
# $1 = insulin.fasta
# $2 = output_dir
``
