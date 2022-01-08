
import 'dart:convert';

List<WorldState> productFromJson(String str) => List<WorldState>.from(json.decode(str).map((x) => WorldState.fromJson(x)));

class WorldState {
  int? updated;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  double? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;
  int? affectedCountries;

  WorldState(
      {this.updated,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion,
      this.affectedCountries});

  WorldState.fromJson(Map<String, dynamic> json) {
    this.updated = json["updated"];
    this.cases = json["cases"];
    this.todayCases = json["todayCases"];
    this.deaths = json["deaths"];
    this.todayDeaths = json["todayDeaths"];
    this.recovered = json["recovered"];
    this.todayRecovered = json["todayRecovered"];
    this.active = json["active"];
    this.critical = json["critical"];
    this.casesPerOneMillion = json["casesPerOneMillion"];
    this.deathsPerOneMillion = json["deathsPerOneMillion"];
    this.tests = json["tests"];
    this.testsPerOneMillion = json["testsPerOneMillion"];
    this.population = json["population"];
    this.oneCasePerPeople = json["oneCasePerPeople"];
    this.oneDeathPerPeople = json["oneDeathPerPeople"];
    this.oneTestPerPeople = json["oneTestPerPeople"];
    this.activePerOneMillion = json["activePerOneMillion"];
    this.recoveredPerOneMillion = json["recoveredPerOneMillion"];
    this.criticalPerOneMillion = json["criticalPerOneMillion"];
    this.affectedCountries = json["affectedCountries"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["updated"] = this.updated;
    data["cases"] = this.cases;
    data["todayCases"] = this.todayCases;
    data["deaths"] = this.deaths;
    data["todayDeaths"] = this.todayDeaths;
    data["recovered"] = this.recovered;
    data["todayRecovered"] = this.todayRecovered;
    data["active"] = this.active;
    data["critical"] = this.critical;
    data["casesPerOneMillion"] = this.casesPerOneMillion;
    data["deathsPerOneMillion"] = this.deathsPerOneMillion;
    data["tests"] = this.tests;
    data["testsPerOneMillion"] = this.testsPerOneMillion;
    data["population"] = this.population;
    data["oneCasePerPeople"] = this.oneCasePerPeople;
    data["oneDeathPerPeople"] = this.oneDeathPerPeople;
    data["oneTestPerPeople"] = this.oneTestPerPeople;
    data["activePerOneMillion"] = this.activePerOneMillion;
    data["recoveredPerOneMillion"] = this.recoveredPerOneMillion;
    data["criticalPerOneMillion"] = this.criticalPerOneMillion;
    data["affectedCountries"] = this.affectedCountries;
    return data;
  }
}
