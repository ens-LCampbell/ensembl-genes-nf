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

// Get species name, gca accession and annotation source from meta table
process BUILD_METADATA {
  label 'default'
  tag "$dbname"

  input:
  tuple val(gca), val(taxon_id)


  output:
  stdout

  script:
  """
  echo "gca,taxon_id"
  echo "$gca,\$$taxon_id"
  """
}