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

// run Busco in genome mode 
process BUSCO_GENOME_LINEAGE {
  label "busco"

  input:
  tuple val(db), val(busco_dataset), path(genome)

  output:
  tuple val(db), path("genome/*.txt")

  script:
  """
  busco -f \
    -i ${genome} \
    --mode genome \
    -l ${busco_dataset} \
    -c ${task.cpus} \
    -o genome \
    --offline \
    --download_path ${params.download_path}
  """
}
