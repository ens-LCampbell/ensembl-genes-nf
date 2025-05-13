# Pipeline to run BUSCO (protein and/or genome mode) and/or Omark.

Define the parameters to run the BUSCO & coredb metadata patching pipeline

## Input/output parameters [REQUIRED]:

Define key params the pipeline requires before initializing.

| Parameter | Description | Type | Required | Hidden |
|-----------|-----------|-----------|-----------|-----------|
| `enscode` | env ENSCODE path. | `string` | True |  |
| `bioperl` | Path to the directory containing the BioPerl library. | `string` | True |  |
| `outDir` | Output directory used to store finalized pipeline data. | `string` | True |  |
| `csvFile` | Path for the input csv file containing the db name(s). | `string` | True |  |

## General workflow parameters:

Parameters required for the workflow to be configured regarding optional processing.

| Parameter | Description | Type | Required | Hidden |
|-----------|-----------|-----------|-----------|-----------|
| `run_busco_core` | Run BUSCO given a mysql db. <details><summary>Help</summary><small>(protein or genome mode see '--busco_mode').</small></details>| `boolean` |  |  |
| `run_busco_ncbi` | Run BUSCO given a assembly_accession and taxonomy id in genome mode only. | `boolean` |  |  |
| `run_omark` | Run OMARK given a mysql db, default false | `boolean` |  |  |
| `run_ensembl_stats` | Run Ensembl statistics given a mysql db | `boolean` |  |  |
| `apply_busco_metakeys` | Create JSON file with BUSCO metakeys and load it into the db. | `boolean` |  |  |
| `apply_ensembl_stats` | Insert Ensembl statistics into a mysql db | `boolean` |  |  |
| `run_ensembl_beta_metakeys` | Run Ensembl beta metakeys given a mysql db. | `boolean` |  |  |
| `apply_ensembl_beta_metakeys` | Insert Ensembl beta metakeys into a mysql db. | `boolean` |  |  |
| `host` | Full mysql host database name. | `string` |  |  |
| `port` | Four digit port number for specified mysql DB host. | `integer` |  |  |
| `password` | Password for MYSQL write-enabled host connection. | `string` |  |  |
| `server_set` | Specific MYSQL write user. <details><summary>Help</summary><small>Related to host server specified: param '--host'.</small></details>| `string` |  |  |
| `team` | Required CoreDB meta_key for data team responsible. <details><summary>Help</summary><small>When 'run_ensembl_beta_metakeys' is enabled this key must be set.</small></details>| `string` |  |  |

## Optional parameters:

Optional parameters defined with defaults but can be altered.

| Parameter | Description | Type | Required | Hidden |
|-----------|-----------|-----------|-----------|-----------|
| `user_w` | DB write user name. | `string` |  |  |
| `user_r` | DB read_only user. | `string` |  |  |
| `project` | Project for the formatting of the output. | `string` |  |  |
| `metatable_keys` | Location of flat file (.txt) containing CoreDB meta table meta_keys. | `string` |  | True |
| `cacheDir` | The path where downloaded files will be cached. | `string` |  |  |
| `cleanCache` | Purge cache_dir if it exists. | `boolean` |  | True |

## Advanced parameters:

Important configuration setup. Not to be changed unless confident on config changes.

| Parameter | Description | Type | Required | Hidden |
|-----------|-----------|-----------|-----------|-----------|
| `canonical_only` | Enable 'canonical only' sequence dumps. | `string` |  |  |
| `ncbiBaseUrl` | Rest API for NCBI datasets v2alpha. | `string` |  | True |
| `genomio_version` | Ensembl-genomio Python library container. | `string` |  |  |
| `files_latency` | Sleep time (seconds) after genome and proteins have been fetched. <details><summary>Help</summary><small>Needed by several file systems due to their internal latency.</small></details>| `integer` |  | True |
| `mysql_cmds` | Location of HPS user mysql-cmds. | `string` |  | True |
| `mysql_ensadmin` | Default user mysql user. | `string` |  | True |

## BUSCO specific config setup:

Regulated/Hidden parameters not shown (show with --validationShowHiddenParams).

| Parameter | Description | Type | Required | Hidden |
|-----------|-----------|-----------|-----------|-----------|
| `busco_mode` | The mode in which to run BUSCO. <details><summary>Help</summary><small>If unspecified the pipeline runs in both genome and protein modes.</small></details>| `string` |  |  |
| `busco_dataset` | User override to explicitly specify the BUSCO dataset. <details><summary>Help</summary><small>Corresponds to a orthoDB lineage set.</small></details>| `string` |  | True |
| `busco_version` | BUSCO version to use. <details><summary>Help</summary><small>BUSCO version corresponding to docker container 'ezlabgva/busco:${params.busco_version}'</small></details>| `string` |  | True |
| `download_path` | Location of pre-downloaded lineage datasets. | `string` |  | True |
| `busco_datasets_file` | Location of pre-downloaded lineage datasets. | `string` |  | True |

## OMARK specific config setup.

Regulated/Hidden parameters not shown (show with --validationShowHiddenParams).

| Parameter | Description | Type | Required | Hidden |
|-----------|-----------|-----------|-----------|-----------|
| `omamer_database` | Location of Omark omamer_db on production file system. | `string` |  | True |
| `omark_singularity_path` | Location of Omark specific singularity SIF image. | `string` |  | True |
