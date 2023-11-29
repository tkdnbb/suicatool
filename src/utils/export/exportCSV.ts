import {jsonToCSV} from 'react-native-csv';

type TravelRecord = {
  serial: string;
  date: string;
  withdrawal: string;
  deposit: string;
  boardingStation: string;
  boardingCompany: string;
  lineName: string;
  disembarkationStation: string;
  disembarkationCompany: string;
  processType: string;
  memo: string;
  cardId: string;
};

const arr = [
  {
    serial: '6',
    date: '2023/09/30',
    withdrawal: '167',
    deposit: '',
  },
  {
    serial: '5',
    date: '2023/09/29',
    withdrawal: '167',
    deposit: '',
  },
  {
    serial: '4',
    date: '2023/09/28',
    withdrawal: '167',
    deposit: '',
  },
];
const jsonStr = JSON.stringify(arr);

export function exportCSV(jsonStr: string) {
  const csv = jsonToCSV(jsonStr);
  return csv;
}

console.log(exportCSV(jsonStr));
