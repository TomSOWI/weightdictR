
<!-- README.md is generated from README.Rmd. Please edit that file -->

# weightdictR

<!-- badges: start -->
<!-- badges: end -->

The goal of weightdictR is to facialiate the deployment of weighted
dictionaries especially one including complex muliword pattern.

## Installation

You can install the development version of weightdictR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("TomSOWI/weightdictR")
```

## Example

First of all clean and prepare textdata. This is **only necessary** if
the weighted dictionary includes **complex multiword-patterns**.

``` r
devtools::install_github("TomSOWI/weightdictR")
#> Using github PAT from envvar GITHUB_PAT
#> Downloading GitHub repo TomSOWI/weightdictR@HEAD
#> Error in utils::download.file(url, path, method = method, quiet = quiet,  : 
#>   Herunterladen von 'https://api.github.com/repos/TomSOWI/weightdictR/tarball/HEAD' fehlgeschlagen

library(weightdictR)
library(quanteda)
#> Package version: 3.3.1
#> Unicode version: 13.0
#> ICU version: 69.1
#> Parallel computing: 12 of 12 threads used.
#> See https://quanteda.io for tutorials and examples.
library(dplyr)
#> 
#> Attache Paket: 'dplyr'
#> Die folgenden Objekte sind maskiert von 'package:stats':
#> 
#>     filter, lag
#> Die folgenden Objekte sind maskiert von 'package:base':
#> 
#>     intersect, setdiff, setequal, union


#First of all clean and prepare textdata. This is only necessary if the weighted dictionary includes complex multiword-patterns.

toksBT17_20_clean <- corpus_to_compound_tokens(corpus = corpBT17_20,
  pattern = klotz_clara$pattern,
  include_totals = TRUE)
#> Warning in make_compounds_updated(text = corpus, patterns = pattern, at_level =
#> "sentence", : No multi-word pattern was provided.

#Include party variable
quanteda::docvars(toksBT17_20_clean)$party <- docvars(corpBT17_20)$party


#This is already done for the example
weightdictR::toksBT17_20_clean
#> Tokens consisting of 93,291 documents.
#> text1 :
#> [1] "ja"
#> 
#> text2 :
#> [1] "ich"  "will"
#> 
#> text3 :
#> [1] "ja"
#> 
#> text4 :
#>  [1] "frau"        "präsidentin" "meine"       "sehr"        "verehrten"  
#>  [6] "damen"       "und"         "herren"      "lieber"      "kollege"    
#> [11] "schäfer"     "sie"        
#> [ ... and 949 more ]
#> 
#> text5 :
#>  [1] "herr"                  "alterspräsident"       "ich"                  
#>  [4] "schlage"               "für"                   "die"                  
#>  [7] "cdu"                   "csubundestagsfraktion" "den"                  
#> [10] "kollegen"              "dr"                    "norbert"              
#> [ ... and 2 more ]
#> 
#> text6 :
#> [1] "herr"      "präsident" "ich"       "nehme"     "die"       "wahl"     
#> [7] "gerne"     "an"       
#> 
#> [ reached max_ndoc ... 93,285 more documents ]

#This is my dictionary
weightdictR::klotz_clara
#>                                                                                                                                                          pattern
#> 1                                                                                      \\b(a|ä)ngst(e)??_(de(s|r)|eine(s|r)|unsere(s|r))_bürger(s|innen|in)??\\b
#> 2                                                                                                                              \\baberwitzig(e|er|es|en|em)??\\b
#> 3                                                                                                                               \\babgehoben(e|er|es|en|em)??\\b
#> 4                                                                                                                              \\ban_der_nase_herumführ(t|en)\\b
#> 5                                                                                                        \\bangeblich(e|er|en)??_([^[:space:]]*?)partei(en)??\\b
#> 6                                                                                                                           \\banma(ß|ss)end(e|er|es|en|em)??\\b
#> 7                                                                                                          \\banständig(e|er|es|en|em)_bürger(s|n|innen|in)??\\b
#> 8                                                                                                                   \\banti(-)??demokratisch(e|er|es|en|em)??\\b
#> 9                                                                                                                              arbeitend(e|er|en)_bevölkerung\\b
#> 10                                                                                                               arbeitend(e|er|en|em)_bürger(s|n|innen|in)??\\b
#> 11                                                                                                                               \\barrogant(e|er|es|en|em)??\\b
#> 12                                                                                                                                                \\barroganz\\b
#> 13                                                                                                                            \\bauf_kosten_der_allgemeinheit\\b
#> 14                                                                                                                        \\bauf_kosten_de(s|r)_beschäftigten\\b
#> 15                                                                                                                 \\bauf_kosten_de(s|r)_bürger(s|innen|in)??\\b
#> 16                                                                                                                        \\bauf_kosten_de(s|r)_deutsche(n|r)\\b
#> 17                                                                                                                                            \\bb(a|ä)nk(i)??er
#> 18                                                                                                                                          \\bbelehre(n|t)??\\b
#> 19                                                                                                                                               belehrung(en)??
#> 20                                                                                                                         \\bberufspolitiker(s|n|innen|in)??\\b
#> 21                                                                                                                           \\bbevölkerung_(.*?_)??wei(ß|ss)\\b
#> 22                                                                                                                                         \\bbevormunde(t|n)\\b
#> 23                                                                                                                                              \\bbosse(n)??\\b
#> 24                                                                                                                             \\bbürgerfern(e|er|es|en|em)??\\b
#> 25                                                                 \\bbürger(innen|in)??_(.*?_)??(die_nase|die_schnauze|satt|genug|dicke)(_.*?)??_(haben|hat)\\b
#> 26                                                                         \\bbürger(innen|in)??_(haben|hat)_(.*?_)??(die_nase|die_schnauze|satt|genug|dicke)\\b
#> 27                                                                \\bbürger(innen|in)??_(.*?_)??(will|(ein)??fordert|möchte|mag|verlangt|beansprucht|wünscht)\\b
#> 28                                                        \\bbürger(innen|in)??_(.*?_)??(wollen|(ein)??fordern|möchten|mögen|verlangen|beanspruchen|wünschen)\\b
#> 29                                                                                                        \\bbürger(s|n|innen|in)??_(von|auf)_der_stra(ß|ss)e\\b
#> 30                                                                                                                                     \\bbürgerwille(n|ns)??\\b
#> 31                                                                                                                                 \\bbürokrat(en|in|innen)??\\b
#> 32                                                                                                                                              desaster(s)??\\b
#> 33                                                                                                                         \\bdeutsche(n|r)??_tradition(en)??\\b
#> 34                                                                                                                                        \\bdiktat(e|s|es)??\\b
#> 35                                                                                                                          \\bdilettantisch(e|er|es|en|em)??\\b
#> 36                                                                                                                                          \\bdilettantismus\\b
#> 37                                                                                                                               \\bdirekt(e|er)??_demokratie\\b
#> 38                                                                                                                                 \\bdreist(e|er|es|en|em)??\\b
#> 39                                                                                                              \\beinfach(e|er|en|em)_bürger(s|n|innen|in)??\\b
#> 40                                                                                                                                           \\belfenbeinturm\\b
#> 41                                                                                                                                                 elite(n)??\\b
#> 42                                                                                                                                        \\bempörung_de(s|r)\\b
#> 43                                                                                                                                          \\berdreiste(t|n)\\b
#> 44                                                                                                                                         establishment(s)??\\b
#> 45                                                                                                         \\betabliert(e|er|en)_([^[:space:]]*?)partei(en)??\\b
#> 46                                                                                                                                                   \\beurokrat
#> 47                                                                                                       \\bfälschlich(erweise)??(_(für|als)(_eine(n)??)??)??\\b
#> 48                                                                                                                                                    \\bfilz\\b
#> 49                                                                                                                                    \\bfinan(c|z)ier(s|e)??\\b
#> 50                                                                                                                                               \\bfrechheit\\b
#> 51                                                                                                                                         \\bfremdherrschaft\\b
#> 52                                                                                                                     \\bfrühstücksdirektor(s|en|innen|in)??\\b
#> 53                                                                                                                            \\bfür_(das|unser)_(.*?_)??volk\\b
#> 54                                                                                                                     \\bfür_die_([^[:space:]]*?_)??mehrheit\\b
#> 55                                                                                                 \\bfür_(die|unsere)_((kleinen|normalen|einfachen)_)??leute\\b
#> 56                                                                                                                                         \\bgängelung(en)??\\b
#> 57                                               \\bgegen_(das|unser)_((eigene(s)??|deutsche(s)??|schweizer|schweizerische(s)??|österreichische(s)??)_)??volk\\b
#> 58                                                                                                                                              \\bgeiselhaft\\b
#> 59                                                                                                                                         \\bgeschacher(e)??\\b
#> 60                                                                                                               \\bgesunde(m|n|r)??_menschenverstand(s|es)??\\b
#> 61                                                                                                                                 \\bgierig(e|er|es|en|em)??\\b
#> 62                                                                                                   \\b(grund)??anständig(e|er|en|em)_bürger(s|n|innen|in)??\\b
#> 63                                                                                                          \\b(grund)??anständig(e|er|es|en|em)_mensch(en)??\\b
#> 64                                                                                                         \\b(grund)??vernünftig(e|er|es|en|em)_mensch(en)??\\b
#> 65                                                                                                                                     \\bgünstling(s|e|en)??\\b
#> 66                                                                 \\b(haben|hat)_(.*?_)??bürger(innen|in)??_(.*?_)??(die_nase|die_schnauze|satt|genug|dicke)\\b
#> 67                                                                                                                              \\bhochmütig(e|er|es|en|em)??\\b
#> 68                                                                                                                                                 \\birrsinn\\b
#> 69                                                                                                                                                    \\birrwitz
#> 70                                                                                                                                  kapitalist(en|in|innen)??\\b
#> 71                                                                                                                                            \\bkonzernlobbyist
#> 72                                                                                                                                                 \\bkorrumpier
#> 73                                                                                                                                \\bkorrupt(e|er|es|en|em)??\\b
#> 74                                                                                                                                                 \\bkreisen\\b
#> 75                                                                                                                                          \\bkuhhandel(s)??\\b
#> 76                                                                                                                                                        kungel
#> 77                                                                                                                                                 \\blebensfern
#> 78                                                                                                                                                \\blebensfremd
#> 79                                                                                                                                                     \\blug\\b
#> 80                                                                                                                         \\bmachtversessen(e|er|es|en|em)??\\b
#> 81                                                                                                                                                   \\bmafia\\b
#> 82                                                                                                                                        \\bmanipulier(t|en)\\b
#> 83                                                                                                                             \\bma(ß|ss)(t|en)_(.*?_)??sich\\b
#> 84                                                                                                                                      \\bmauschelei(en|n)??\\b
#> 85                                                                                                                \\bmehrheit_(der|im|in_der|unter_den|aller)\\b
#> 86                                                                                                                        \\bmehrheit_(des|im)_volk(s|es|e)??\\b
#> 87                                                                                                                                  \\bmehrheitsmeinung(en)??\\b
#> 88                                                                                                                             \\bnimmersatt(e|er|es|en|em)??\\b
#> 89                                                                                                                                            \\bnomenklatura\\b
#> 90                                                                                                               \\bnormal(e|er|en|em)_bürger(s|n|innen|in)??\\b
#> 91                                                                                                                                            \\bnormalsterblich
#> 92                                                                                                                         \\boberlehrerhaft(e|er|es|en|em)??\\b
#> 93                                                                                                                        \\boberlehrer(s|n|in|innen|rolle)??\\b
#> 94                                                                                                                                             \\boberschicht\\b
#> 95                                                                                                                                   \\bohne_(.*?_)??rückgrat\\b
#> 96                                                                                                                              \\bopportunist(en|in|innen)??\\b
#> 97                                                                                                                    partei(en)??_(.*?_)??(be|an)??lüg(t|en)\\b
#> 98                                                                                                                                     \\bparteien(-)??system\\b
#> 99                                                                                                                                                 \\bpfründe\\b
#> 100                                                                                                                           \\bplebiszitär(e|er|es|en|em)??\\b
#> 101                                                                                                                                             \\bpöbel(s)??\\b
#> 102                                                                                                                                   \\bpolitikversagen(s)??\\b
#> 103                                                                                                                      \\bpolitische(n|m|s)??_versagen(s)??\\b
#> 104                                                                                                                               \\bpolitische(r|n)??_klasse\\b
#> 105                                                                                                                                       \\bpostengeschacher\\b
#> 106 \\b(prinzipien|gesinnung|überzeugung(en)??|grundsätze)_(über_bord_w(e|i)rf(en|t)|verr(a|ä)t(en)??|verg(e|i)ss(en|t)|änder(t|n)|wechsel(t|n)|tausch(t|en))\\b
#> 107                                                                                                                                             \\bprinzipienlos
#> 108                                                                                                                                                 \\bpropagand
#> 109                                                                                                                                                \\braubritter
#> 110                                                                                                                                         \\brealitätsferne\\b
#> 111                                                                                                                         \\brealitätsfern(e|er|es|en|em)??\\b
#> 112                                                                                                                        \\brealitätsfremd(e|er|es|en|em)??\\b
#> 113                                                                                                       \\brechtschaffen(e|er|en|em)_bürger(s|n|innen|in)??\\b
#> 114                                                                                                                                               \\brückgratlos
#> 115                                                                                                                                           \\bsagen_dürfen\\b
#> 116                                                                                                                                            \\bschäm(t|en)\\b
#> 117                                                                                                                                                \\bschande\\b
#> 118                                                                                                                                             \\bschickeria\\b
#> 119                                                                                                                           \\bschweigend(e|er|en)_mehrheit\\b
#> 120                                                                                                                        \\bselbstgefällig(e|er|es|en|em)??\\b
#> 121                                                                                                                                            \\bselbstherrlich
#> 122                                                                                                                       \\bselbstzufrieden(e|er|es|en|em)??\\b
#> 123                                                                               \\bsich_(.*?_)??bürger(innen|in)??_(.*?_)??(wehr|widersetz|verteidig)(t|en)\\b
#> 124                                                                                                                      \\bso(-|_)??genannt(e|er|es|en|em)??\\b
#> 125                                                                                                                               \\bspekulant(en|in|innen)??\\b
#> 126                                                                                                                                    \\bstaatsversagen(s)??\\b
#> 127                                                                                                                             \\bstandhaft(e|er|es|en|em)??\\b
#> 128                                                                                                       \\bsteuerzahlend(e|er|en|em)_bürger(s|n|innen|in)??\\b
#> 129                                                 \\bsteuerzahler(innen|in)??_(.*?_)??(wollen|(ein)??fordern|möchten|mögen|verlangen|beanspruchen|wünschen)\\b
#> 130                                                                                                                         \\bstrippenzieher(s|n|in|innen)??\\b
#> 131                                                                                                                                           \\btäusch(t|en)\\b
#> 132                                                                                                                                              \\btäuschung\\b
#> 133                                                                                                                                                \\btechnokrat
#> 134                                                                                                                                        \\btradition(en)??\\b
#> 135                                                                                                                                           \\btricks(t|en)\\b
#> 136                                                                                                                           \\büberheblich(e|er|es|en|em)??\\b
#> 137                                                                                                                        \\bundemokratisch(e|er|es|en|em)??\\b
#> 138                                                                                                                                                 \\bunehrlich
#> 139                                                                                                                             \\bunehrlich(e|er|es|en|em)??\\b
#> 140                                                                                                                                                  \\bunmut\\b
#> 141                                                                                                                   \\buns(er(e|er|en))??_bürger(n|innen)??\\b
#> 142                                                                                                             \\buns(er(e|er|en))??_steuerzahler(n|innen)??\\b
#> 143                                                                                                                                            \\bunters_volk\\b
#> 144                                                                                                                                        \\bunverfrorenheit\\b
#> 145                                                                                                                           \\bunverschämt(e|er|es|en|em)??\\b
#> 146                                                                                                                                        \\bverhöhn(t|en)??\\b
#> 147                                                                                                                            \\bverkrustet(e|er|es|en|em)??\\b
#> 148                                                                                                                              \\bverlogen(e|er|es|en|em)??\\b
#> 149                                                                                                                             \\bversagend(e|er|es|en|em)??\\b
#> 150                                                                                                                             \\bvetter(n|li|les)wirtschaft\\b
#> 151                                                                                                                                 \\bvolk_(ab)??stimm(t|en)\\b
#> 152                                                                                                                                  \\bvolksabstimmung(en)??\\b
#> 153                                                                                                                               \\bvolksentscheid(s|e|en)??\\b
#> 154                                                                                                                                           \\bvolksverr(a|ä)t
#> 155                                                                                                                                     \\bvolkswille(n|ns)??\\b
#> 156                                                                             \\bvolk_(.*?_)??(will|(ein)??fordert|möchte|mag|verlangt|beansprucht|wünscht)\\b
#> 157                                                                                                                                         \\bvon_oben_herab\\b
#> 158                                                                                                                                        \\bwählertäuschung\\b
#> 159                                                                                                                            \\bwahnwitzig(e|er|es|en|em)??\\b
#> 160                                                                                                                          \\bwei(ß|ss)_(.*?_)??bevölkerung\\b
#> 161                                                                                                                             \\bweltfremd(e|er|es|en|em)??\\b
#> 162                                                                                                                                     \\bwendeh(a|ä)ls(e)??\\b
#> 163                                                                    \\b(will|(ein)??fordert|möchte|mag|verlangt|beansprucht|wünscht)_(.*?_)??allgemeinheit\\b
#> 164                                                                      \\b(will|(ein)??fordert|möchte|mag|verlangt|beansprucht|wünscht)_(.*?_)??bevölkerung\\b
#> 165                                                               \\b(will|(ein)??fordert|möchte|mag|verlangt|beansprucht|wünscht)_(.*?_)??bürger(innen|in)??\\b
#> 166                                                                             \\b(will|(ein)??fordert|möchte|mag|verlangt|beansprucht|wünscht)_(.*?_)??volk\\b
#> 167                                                                                                                            \\bwir_(als_)??bürger(innen)??\\b
#> 168                                                                                                                      \\bwir_(als_)??steuerzahler(innen)??\\b
#> 169                                                        \\b(wollen|(ein)??fordern|möchten|mögen|verlangen|beanspruchen|wünschen)_(.*?_)??arbeiter(innen)??\\b
#> 170                                                          \\b(wollen|(ein)??fordern|möchten|mögen|verlangen|beanspruchen|wünschen)_(.*?_)??bürger(innen)??\\b
#> 171                                                    \\b(wollen|(ein)??fordern|möchten|mögen|verlangen|beanspruchen|wünschen)_(.*?_)??steuerzahler(innen)??\\b
#> 172                                                                           \\b(wunsch|wünsche|anliegen|ansuchen|verlangen)_(der|einer|unserer)_bevölkerung\\b
#> 173                                                                                                                              \\bzentralist(en|in|innen)??\\b
#> 174                                                                                                                        \\bzentralistisch(e|er|es|en|em)??\\b
#> 175                                                                                                                                                \\bzugeben\\b
#> 176                                                                                                                    \\bzu(_)??lasten_de(s|r)_deutsche(n|r)\\b
#> 177                                                                                                       \\bzu(_)??lasten_de(s|r)_steuerzahler(s|innen|in)??\\b
#> 178                                                                                                                                    \\bzum_schaden_de(s|r)\\b
#> 179                                                                                                              arbeitend(e|er|es|en|em)_deutsche(n|r|s|m)??\\b
#> 180                                                                                                                \\b(grund)??vernünftig(e|er|en)_leute(n)??\\b
#> 181                                                                                                                             \\bhochnäsig(e|er|es|en|em)??\\b
#> 182                                                                                                                                          \\blakai(e|en)??\\b
#> 183                                                                                                                                 partei(en)??(-)??diktatur\\b
#> 184                                                                                                                               \\bpolitische(s|n|m)??_theater
#> 185                                                                                                    \\bdurchschnittlich(e|er|es|en|em)_deutsche(n|r|s|m)??\\b
#> 186                                                                                                                  \\bdurchschnitts(-)??deutsche(n|r|s|m)??\\b
#> 187                                                                                                                         \\bhirnverbrannt(e|er|es|en|em)??\\b
#> 188                                                                                                                                       \\bmachthunger(s)??\\b
#> 189                                                                                                                               \\bpolitiker(-)??kaste(n)??\\b
#> 190                                                                                                         \\bso(-)??genannt(e|er|en)_([^[:space:]]*?)medien\\b
#> 191                                                                                                                                              \\bstimmvieh\\b
#> 192                                                                                                                                       \\bteil_des_systems\\b
#> 193                                                                                                                                      \\bvolkssouveränität\\b
#> 194                                                                                                                                         \\bpolit(-)??theater
#> 195                                                                                                             \\bredlich(e|er|en|em)_bürger(s|n|innen|in)??\\b
#> 196                                                                                                                                   \\balt(-)??partei(en)??\\b
#> 197                                                                                                                                      \\bapparatschik(s)??\\b
#> 198                                                                                                                                                     \\bbonze
#> 199                                                                                                               \\bdurchschnitts(-)??bürger(s|n|innen|in)??\\b
#> 200                                                                                                                               \\bglobalist(en|in|innen)??\\b
#> 201                                                                                                                                   \\bhausverstand(s|es)??\\b
#> 202                                                                                                             \\bkanzler(innen)??darsteller(s|n|innen|in)??\\b
#> 203                                                                                                                                     \\bmachtversessenheit\\b
#> 204                                                                                                                                     partei(en)??(-)??kartell
#> 205                                                                                                                               \\bpolitische(r|n|m|s)??_kaste
#> 206                                                                                                                                \\bsystem(-)??partei(en)??\\b
#> 207                                                                \\bwähler(innen|in)??_(.*?_)??(die_nase|die_schnauze|satt|genug|dicke)(_.*?)??_(haben|hat)\\b
#> 208                                                                                                    \\bdurchschnittlich(e|er|en|em)_bürger(s|n|innen|in)??\\b
#> 209                                                                                                                                               \\bschmierfink
#> 210                                                                                           \\b(a|ä)ngst(e)??_(de(s|r)|eine(s|r)|unsere(s|r))_deutsche(n|r)\\b
#> 211                                                                                                                          \\bmachthungrig(e|er|es|en|em)??\\b
#>        weight
#> 1   0.8571429
#> 2   0.6695652
#> 3   0.7516340
#> 4   0.8571429
#> 5   0.7692308
#> 6   0.7468354
#> 7   1.0000000
#> 8   0.5123967
#> 9   0.7462687
#> 10  0.6428571
#> 11  0.7479675
#> 12  0.7524272
#> 13  0.4285714
#> 14  0.5833333
#> 15  0.6153846
#> 16  0.4375000
#> 17  0.6313559
#> 18  0.8344371
#> 19  0.7046632
#> 20  0.6666667
#> 21  0.5333333
#> 22  0.7581699
#> 23  0.7659574
#> 24  0.8750000
#> 25  1.0000000
#> 26  0.8333333
#> 27  0.7662338
#> 28  0.7480916
#> 29  0.7500000
#> 30  0.6666667
#> 31  0.6250000
#> 32  0.7451613
#> 33  0.8000000
#> 34  0.5894737
#> 35  0.5818182
#> 36  0.7894737
#> 37  0.6807229
#> 38  0.6489676
#> 39  0.8260870
#> 40  0.6363636
#> 41  0.6428571
#> 42  0.5294118
#> 43  0.7200000
#> 44  0.7142857
#> 45  0.6486486
#> 46  0.6111111
#> 47  0.6193548
#> 48  0.5882353
#> 49  0.6829268
#> 50  0.8767773
#> 51  0.6000000
#> 52  1.0000000
#> 53  0.5950413
#> 54  0.7320261
#> 55  0.7526882
#> 56  0.6136364
#> 57  0.5600000
#> 58  0.7017544
#> 59  0.7540984
#> 60  0.7192982
#> 61  0.7500000
#> 62  1.0000000
#> 63  0.5384615
#> 64  0.6792453
#> 65  0.6000000
#> 66  0.6666667
#> 67  0.6666667
#> 68  0.7678571
#> 69  0.5666667
#> 70  0.7142857
#> 71  0.4285714
#> 72  0.6800000
#> 73  0.5256410
#> 74  0.6208333
#> 75  0.6865672
#> 76  0.6701031
#> 77  0.5000000
#> 78  0.6666667
#> 79  0.6956522
#> 80  0.4000000
#> 81  0.6500000
#> 82  0.6086957
#> 83  0.7222222
#> 84  0.6250000
#> 85  0.6114130
#> 86  0.8181818
#> 87  0.8695652
#> 88  0.8333333
#> 89  0.9166667
#> 90  0.7750000
#> 91  1.0000000
#> 92  0.6521739
#> 93  0.6521739
#> 94  0.7037037
#> 95  0.6666667
#> 96  0.4615385
#> 97  1.0000000
#> 98  0.8333333
#> 99  0.7916667
#> 100 0.4705882
#> 101 0.8333333
#> 102 0.7000000
#> 103 0.7500000
#> 104 0.6923077
#> 105 0.5000000
#> 106 0.6000000
#> 107 0.8888889
#> 108 0.6056972
#> 109 0.6666667
#> 110 0.7058824
#> 111 0.7106918
#> 112 0.6724138
#> 113 0.5555556
#> 114 0.6363636
#> 115 0.9135802
#> 116 0.8675722
#> 117 0.8830409
#> 118 0.7500000
#> 119 0.8000000
#> 120 0.5641026
#> 121 0.5000000
#> 122 0.7000000
#> 123 0.8000000
#> 124 0.4685826
#> 125 0.6803519
#> 126 0.6262626
#> 127 0.7764706
#> 128 0.6666667
#> 129 0.8000000
#> 130 0.6000000
#> 131 0.7422222
#> 132 0.6900585
#> 133 0.6542056
#> 134 0.6744367
#> 135 0.7175573
#> 136 0.6363636
#> 137 0.6400000
#> 138 0.8221154
#> 139 0.8105263
#> 140 0.6835443
#> 141 0.6965670
#> 142 0.5510204
#> 143 0.6000000
#> 144 0.8333333
#> 145 0.7765957
#> 146 0.6305732
#> 147 0.5000000
#> 148 0.7771429
#> 149 0.2000000
#> 150 0.5617978
#> 151 0.5000000
#> 152 0.6860465
#> 153 0.6598985
#> 154 0.3333333
#> 155 0.6000000
#> 156 0.8461538
#> 157 0.5932203
#> 158 0.7692308
#> 159 0.4102564
#> 160 1.0000000
#> 161 0.7315436
#> 162 0.7500000
#> 163 0.3333333
#> 164 0.8214286
#> 165 0.6739130
#> 166 0.5454545
#> 167 0.5918367
#> 168 0.5000000
#> 169 1.0000000
#> 170 0.6577947
#> 171 0.6222222
#> 172 0.6875000
#> 173 0.7500000
#> 174 0.4563107
#> 175 0.8634812
#> 176 0.3928571
#> 177 0.5294118
#> 178 0.3770492
#> 179 0.2857143
#> 180 0.8181818
#> 181 1.0000000
#> 182 0.5000000
#> 183 0.6666667
#> 184 1.0000000
#> 185 1.0000000
#> 186 1.0000000
#> 187 1.0000000
#> 188 0.6666667
#> 189 0.7500000
#> 190 0.5000000
#> 191 0.8333333
#> 192 0.8000000
#> 193 0.5714286
#> 194 1.0000000
#> 195 1.0000000
#> 196 0.7320872
#> 197 0.5000000
#> 198 0.5000000
#> 199 1.0000000
#> 200 0.5714286
#> 201 0.0000000
#> 202 0.0000000
#> 203 1.0000000
#> 204 1.0000000
#> 205 0.0000000
#> 206 0.2500000
#> 207 1.0000000
#> 208 1.0000000
#> 209 1.0000000
#> 210 0.0000000
#> 211 1.0000000


#Deploy my weighted dictionary using the main function of this package: **run_weightdict**

result_klotz <- run_weightdict(
  text = weightdictR::toksBT17_20_clean,
  dict = klotz_clara,
  dict_name = "klotz"
  )

# Individual context information -----------------------------------------------

#Add party 
party <- data.frame(docname = quanteda::docnames(corpBT17_20), party = docvars(corpBT17_20)$party)
result_klotz <- merge(result_klotz, party)

#Add totals
totals <- data.frame(docname = quanteda::docnames(corpBT17_20), nsentences = nsentence(corpBT17_20), ntokens = ntoken(corpBT17_20))
result_klotz <- merge(result_klotz, totals)

# Final result
result <- result_klotz %>%
  group_by(party) %>%
  reframe(
    nsentence = sum(nsentences),
    ntokens = sum(ntokens),
    klotz_clara = sum(weight)/nsentence,
  )
result
#> # A tibble: 7 × 4
#>   party        nsentence ntokens klotz_clara
#>   <chr>            <int>   <int>       <dbl>
#> 1 AfD              85452 1602142      0.0318
#> 2 CDU/CSU         271627 5271472      0.0181
#> 3 DIE LINKE.      164107 2982756      0.0224
#> 4 FDP              78019 1471624      0.0208
#> 5 Fraktionslos      1415   26940      0.0368
#> 6 Grüne           123357 2339231      0.0207
#> 7 SPD             210095 4088700      0.0189

#You may continue by comparing the results using z-transformation
result$klotz_clara_z <- scale(result$klotz_clara, center = T)
```
