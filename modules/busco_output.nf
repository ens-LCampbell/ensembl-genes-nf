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

include { make_publish_dir } from './utils.nf'

process BUSCO_OUTPUT {
    // rename busco summary file in <production name>_gca_busco_short_summary.txt
    tag "$db.species-$name"
    label 'default'
    publishDir { make_publish_dir(db.publish_dir, project, 'statistics') },  mode: 'copy'

    input:
    tuple val(db), path(summary_file, stageAs: "short_summary.txt")
    val(name)
    val(project)

    output:
    path("*busco_short_summary.txt")

    script:
    def summary_name = summary_file
    if (project == 'ensembl') {
        def species = db.species.toLowerCase()
        def gca = db.gca.toLowerCase().replaceAll(/\./, "v").replaceAll(/_/, "")
        summary_name = [species, gca, name, "short_summary.txt"].join("_")
    } else if (project == 'BRC') {
        summary_name = "genome_busco_short_summary.txt"
    }
    """
    sed '/Summarized benchmarking in BUSCO notation for file/d' $summary_file > $summary_name
    """
}
