from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

ext_modules=[
    Extension("libdill",
              sources=["libdill.pyx"],
              include_dirs=["/usr/local/include"],
              libraries=["dill"],
              library_dirs=["/usr/local/lib"]
    )
]

setup(
  name = "libdill",
  ext_modules = cythonize(ext_modules)
)
