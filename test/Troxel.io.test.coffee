'use strict'
should = require 'should'

require './TestUtils'
Base64IO = require '../coffee/Troxel.io'

describe 'Base64IO', ->
  model = base64 = null
  before ->
    model = require './models/chr_knight.json'
    base64 = require './models/chr_knight.base64.json'
  describe 'import', ->
    it 'should be able to load from base64', ->
      io = new Base64IO base64.chr_knight
      io.should.have.ownProperty('readonly', 'expected io.readonly to be defined').eql(0)
      io.should.have.ownProperty('x', 'expected io.x to be defined').equal(20, 'expected io.x to be 20')
      io.should.have.ownProperty('y', 'expected io.y to be defined').equal(20, 'expected io.y to be 20')
      io.should.have.ownProperty('z', 'expected io.z to be defined').equal(21, 'expected io.z to be 21')
      io.should.have.ownProperty('voxels', 'expected io.voxels to be defined')
      JSON.parse(JSON.stringify(io.voxels)).should.eql(model.voxels)
    it 'should be able to load from base64 (readonly)', ->
      io = new Base64IO base64.chr_knight_ro
      io.should.have.ownProperty('readonly', 'expected io.readonly to be defined').eql(1)
      io.should.have.ownProperty('x', 'expected io.x to be defined').equal(20, 'expected io.x to be 20')
      io.should.have.ownProperty('y', 'expected io.y to be defined').equal(20, 'expected io.y to be 20')
      io.should.have.ownProperty('z', 'expected io.z to be defined').equal(21, 'expected io.z to be 21')
      io.should.have.ownProperty('voxels', 'expected io.voxels to be defined')
      JSON.parse(JSON.stringify(io.voxels)).should.eql(model.voxels)
  describe 'export', ->
    io = null
    before ->
      io = new Base64IO model
    it 'should be able to export to base64', ->
      io.export(false).should.equal(base64.chr_knight)
    it 'should be able to export to base64 (readonly)', ->
      io.export(true).should.equal(base64.chr_knight_ro)
