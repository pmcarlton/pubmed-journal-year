### pubmed-journal-year.pl

#### Usage: 

    ./pubmed-journal-year.pl SEARCHTERM

Performs a search of Pubmed for your term(s) and returns a text histogram of all journals over all years for that term.

Example:

    ./pubmed-journal-year.pl "\"meiotic recombination\""

    1929 records
    1   ACS_Nano            |                                                    . |
    1   Acta_Med_Austriaca  |                            .                         |
    1   Adv_Cancer_Res      |                                                    . |
    1   Adv_Exp_Med_Biol    |                                                     .|
    1   Adv_Genet           |                                     .                |
    1   Aging_Cell          |                                                 .    |
    *<skipping 258 lines>*
    7   J_Mol_Biol          |                                 .    . .. .  ..      |
    7   Mol_Biol_Evol       |                                         .   .... ..  |
    8   Am_J_Med_Genet      |                    .          . ..  .  ...           |
    8   Exp_Cell_Res        |                          .  .              . ..    . |
    8   Genet_Res           |                  .               .   .  ..  .        |
    8   Heredity_(Edinb)    |                                          ...  ..  .  |
    8   Mol_Genet_Genomics  |                                          .. ...      |
    9   Am_J_Med_Genet_A    |                                            ..   .... |
    9   BMC_Genomics        |                                              . ..... |
    9   Genes_Cells         |                                    ....   .  .     . |
    9   Immunogenetics      |                           .     .. . .   .           |
    9   PLoS_Biol           |                                            .  ... .  |
    9   Trends_Genet        |                                   .    .  ..     ... |
    10  Chromosome_Res      |                                          ..   o. ..  |
    10  Hum_Reprod          |                                      .     ........  |
    11  Biochem_Soc_Trans   |                                             .o  .    |
    11  Bioessays           |                                    ..   . .....  .   |
    11  Cell_Cycle          |                                            ... . ... |
    11  Plant_Cell          |                                   . ...  ...  .    . |
    12  Gene                |                                   .  .. .... ..  . . |
    12  J_Cell_Biol         |                                  .  . .    .. .. .   |
    13  Hum_Genet           |                           ... . ..   ..     ... .  . |
    14  Plant_J             |                                       .     .... ... |
    15  DNA_Repair_(Amst)   |                                            .o......  |
    15  Genetika            |                 .            ...       ..  ... ... . |
    15  Genome_Res          |                                    . . .   . .  .... |
    16  Genome              |                            ..   .  .   .... . .  .   |
    16  J_Biol_Chem         |                        .      .   .   . ...... ... . |
    17  J_Cell_Sci          |                                      . .  . ....  .. |
    17  Mol_Biol_Cell       |                                     .   ...... .. .  |
    21  Nat_Genet           |                                 .  .... o. ..  . . . |
    22  Hum_Mol_Genet       |                                .. .  . . ......  ..  |
    24  Curr_Biol           |                                  .. .   . ..o.. .... |
    25  Cytogenet_Genome_Res|                                          ..Oo ....   |
    25  Mol_Cell            |                                      ....o...  ... . |
    26  PLoS_One            |                                                ..oOo |
    27  Methods_Mol_Biol    |                                    .       .    O o. |
    28  Am_J_Hum_Genet      |                    .   ... .   ... . . ..o .... . .. |
    28  Genomics            |                            .. ..  o.o.o. .   ...     |
    28  Nature              |                        ..   ....   .o.  .. ... . ..  |
    28  Science             |.                          .. . . .. .. . ....  . o.o |
    30  Curr_Genet          |                         ..   . ...o.o.   . ... . .   |
    30  Mol_Gen_Genet       |           ..  .. .. . . .  . ... . .o. .             |
    35  Mutat_Res           |           .  .  . .    . ..   ... ........ . ..  ..  |
    41  Chromosoma          |                . .. ..    .     .. .   o ....o.......|
    41  Genes_Dev           |                               .  ....o..o.. o..o...  |
    43  EMBO_J              |                         ..... .. .....oo....  o .. . |
    49  Nucleic_Acids_Res   |                        .   .  .....  o.o .....o. o.o.|
    51  Cell                |                    . ... . . .. .....o ....o..  .... |
    54  PLoS_Genet          |                                             ..ooOooO |
    77  Mol_Cell_Biol       |                     .  ... ooo... ....o..ooooo..o. . |
    104 Proc_Natl_Acad_Sci_U|                ....... ....o..o..oooo..o...o.oo.oo.o.|
    265 Genetics            |           .. ....o.o ..oo..ooooOooOOOoOoOOOoOOoOo.o..|
    # Showing from 1960 to 2013; . for 1 to 3; o for 4 to 9; O for 10 to 19

:
