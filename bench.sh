#!/usr/bin/env bash

set -uex

CWD=$(pwd)
TIME="/usr/bin/time -v"
CHR1_FASTA="/xdisk/twheeler/data/genomes/human/t2t/chr1.fa"
CHR1_TXT="/xdisk/twheeler/data/genomes/human/t2t/chr1.txt"
UNIPROT_FASTA="/xdisk/twheeler/data/uniprot/uniprot_sprot.2024_06.fasta"
UNIPROT_TXT="/xdisk/twheeler/data/uniprot/uniprot_sprot.2024_06.txt"
TREMBL_FASTA="/xdisk/twheeler/data/uniprot/uniprot_trembl.2024_06.fasta"
TREMBL_TXT="/xdisk/twheeler/data/uniprot/uniprot_trembl.2024_06.txt"

cd "$CWD/libdivsufsort"
for FILE in "$CHR1_TXT" "$UNIPROT_TXT" "$TREMBL_TXT"; do
    BASENAME=$(basename "$FILE")
    $TIME ./examples/mksary "$FILE" "$BASENAME.out"
done

cd "$CWD/caps_sa"
for THREADS in 1 8 16; do
    export PARLAY_NUM_THREADS=$THREADS
    for FILE in "$CHR1_FASTA" "$UNIPROT_FASTA" "$TREMBL_FASTA"; do
        BASENAME=$(basename "$FILE")
        $TIME ./build/src/caps_sa "$FILE" "$BASENAME.out"
    done
done
