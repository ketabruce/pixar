from pathlib import Path

from dagster_dbt import DbtProject

pixar_project = DbtProject(
    project_dir=Path(__file__).joinpath("..", "..", "..", "dbt_pixar").resolve(),
    packaged_project_dir=Path(__file__).joinpath("..", "..", "dbt-project").resolve(),
)
pixar_project.prepare_if_dev()