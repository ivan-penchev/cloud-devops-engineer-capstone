import { Injectable } from '@angular/core';
import {Observable} from 'rxjs';
import {HttpClient} from '@angular/common/http';
import {of} from 'rxjs';
import {confirmedCsv} from '../mock/covid_confirmed';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  constructor(private http: HttpClient) {
  }

  private getConfirmedCases(): Observable<string> {
    return this.http.get(`./assets/time_series_covid19_confirmed_global.csv`, {responseType: 'text'});
  }

  private getDeaths(): Observable<string> {
    return this.http.get(`./assets/time_series_covid19_deaths_global.csv`, {responseType: 'text'});
  }

  private getRecovered(): Observable<string> {
    return this.http.get(`./assets/time_series_covid19_recovered_global.csv`, {responseType: 'text'});
  }

  private getMockedConfirmedCases(): Observable<string> {
    // return of(frConfirmedCsv)
    return of(confirmedCsv);
  }

  getData(status: string): Observable<string> {
    console.log('get data from status:' + status);
    if (status === 'confirmed') {
      return this.getConfirmedCases();
    } else if (status === 'deaths') {
      return this.getDeaths();
    } else if (status === 'recovered') {
      return this.getRecovered();
    }
    else {
      return this.getMockedConfirmedCases();
    }
  }
}
