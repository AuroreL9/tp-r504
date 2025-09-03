import pytest
import fonctions as f

def test_1():
	assert f.exposant(2,3)==8
	assert f.exposant(2,2)==4

def test_2():
	assert f.exposant(-1,2)==1
	assert f.exposant(-1,3)==-1
	assert f.exposant(-1,-1)==-1
	assert f.exposant(-1,-2)==1
	assert f.exposant(-2,-1)==-0.5

def test_3():
	assert f.exposant(0,5)==0
	assert f.exposant(0,1)==0
	assert f.exposant(0,9)==0
	assert f.exposant(0,12)==0

def test_4():
	with pytest.raises(ValueError):
		f.exposant(0,0)
