-- DDL statement to create an actors_history_scd table that tracks
-- the following fields for each actor in the actors table:
-- quality_class, is_active, start_date, end_date
CREATE OR REPLACE TABLE positivelyamber.actors_history_scd(
    -- The id of the actor that the history is associated with
    actor_id VARCHAR,
    -- The quality bucket of the actor
    quality_class VARCHAR,
    -- Whether the actor is making films this year
    is_active BOOLEAN,
    -- The start date of what is being tracked
    start_date INTEGER,
    -- The end date of what is being tracked
    end_date INTEGER,
    -- Current year for easy filtering
    current_year INTEGER
)
WITH (
    -- Parquet formatting
    format = 'PARQUET',
    -- Partition by year
    partitioning = ARRAY['current_year']
)