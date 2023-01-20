#!/home/indy/.pyenv/shims/python3
  
import cProfile
import pstats
import io
import aries_cloudagent
import runpy

pr = cProfile.Profile()
pr.enable()
result = runpy._run_module_as_main("aries_cloudagent", alter_argv=False)
pr.disable()
pr.dump_stats('dump_stats')