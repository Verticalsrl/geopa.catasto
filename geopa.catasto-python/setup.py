from setuptools import setup, find_packages
import os

version = '1.0'

setup(
    name='geopa.catasto',
    version=version,
    description="Italian land registry utilities",
    long_description=open("README.txt").read() + "\n" +
        open(os.path.join("docs", "HISTORY.txt")).read(),
    classifiers=[
        "Programming Language :: Python",
        "Development Status :: 3 - Alpha",
        "Environment :: Console",
        "License :: OSI Approved :: GNU General Public License (GPL)",
        "Topic :: Scientific/Engineering :: GIS",
    ],
    keywords='',
    author='Armando Riccardo Gaeta',
    author_email='ar_gaeta@yahoo.it',
    url='',
    license='GPL',
    packages=find_packages(exclude=['ez_setup']),
    namespace_packages=['geopa'],
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        'setuptools',
        'GDAL',
        'SQLAlchemy',
    ],
    entry_points="""
        [console_scripts]
        cxf2ogr = geopa.catasto.apps:main_cxf
        ter2db = geopa.catasto.apps:main_ter
        fab2db = geopa.catasto.apps:main_censuario
    """,
)
