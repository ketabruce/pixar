from dagster import Definitions
from dagster_dbt import DbtCliResource
from .assets import pixar_dbt_assets
from .project import pixar_project
from .schedules import schedules

defs = Definitions(
    assets=[pixar_dbt_assets],
    schedules=schedules,
    resources={
        "dbt": DbtCliResource(project_dir=pixar_project),
    },
)