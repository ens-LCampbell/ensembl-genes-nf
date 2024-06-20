/*
See the NOTICE file distributed with this work for additional information
regarding copyright ownership.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

process RUN_REPEATMASKER {
    label 'run_repeatmasker'
    tag "$gca:genome"
    publishDir "${params.outDir}/repeatmasker/"

    input:
     tuple val(row), path("${row.gca}.families.stk")

    output:
     tuple val(row), path("${row.gca}.families.stk.out.gff")

    script:
    """
    RepeatMasker -nolow -lib ${row.gca}.families.stk -species "${row.species_name}" "${genome_fasta}" engine "${engine}" -dir . -gff
    """
}
