{{ 
    config(
        materialized="incremental", 
        incremental_strategy="microbatch", 
        begin='2026-07-03',
        event_time='date',
        batch_size='day',
		lookback=2, 
		concurrent_batches=false
    ) 
}}

select 
    address, 
    block_number, 
    bytecode, 
    date, 
    last_modified

from {{ source("eth", "contracts") }}