---
-- Name: DET-304 - Dectection Filter STRUCTURE
-- Author: FlightControl
-- Date Created: 12 Apr 2017
--
-- # Situation:
--
-- Demonstrates the filtering of detections.
-- 
-- # Test cases:
-- 
-- 1. Observe the reporting only detecting the structure, not the other units.

SetGroup = SET_GROUP:New():FilterPrefixes( "Recce" ):FilterStart()

HQ = GROUP:FindByName( "HQ" )

CC = COMMANDCENTER:New( HQ, "HQ" )

RecceDetection = DETECTION_UNITS:New( SetGroup ):FilterCategories( Unit.Category.STRUCTURE )

RecceDetection:Start()

--- OnAfter Transition Handler for Event Detect.
-- @param Functional.Detection#DETECTION_UNITS self
-- @param #string From The From State string.
-- @param #string Event The Event string.
-- @param #string To The To State string.
function RecceDetection:OnAfterDetect(From,Event,To)

  local DetectionReport = self:DetectedReportDetailed()

  HQ:MessageToAll( DetectionReport, 15, "Detection" )
end

collectgarbage()
