import {getScofScss, getScsDetails} from "@/db-SDK";

export async function generateHTMLContent(scsId) {
    const scs = await retrieveSCSData(scsId);
    const scOfScs = await retrieveScOfScs(scsId)
    console.log(scOfScs)
    const typeAmountMap = computeScsData(scOfScs)
    const totalAmount = getTotalAmount(typeAmountMap).toFixed(2)
    const paid = 0
    const toPay = totalAmount - paid

    return `
  <style>
    .report {
      padding: 4vb;
      font-size: 12px;
      min-height: 100%
    }
    .table-header {
      border-bottom: 1px solid #193058;
      text-align: left;
    }
    .table-row {
      border-bottom: 1px solid #193058;
    }
  
    .table-highlight {
      background-color: rgb(180, 211, 237, 0.3);
    }
    .table-sum {
      border-top: 2px solid #193058;
      border-bottom: 2px double #193058;
      color: #b6163d;
    }
    .table-number {
        text-align: right;
        padding-right: 10px;
    }
    
  </style>
  <div class="report">
    <header>
      <table style="width: 100%">
    <tbody>
        <tr>
<td>
    <img
          src="data:image/png;base64,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"
          style="width: 325px; height: 64.809384px; align-items: center"
      />
</td>
<td>
    <p>
        DREAMHOME </br>
        Flandernstraße 101 </br>
        73732 Esslingen
      </p>
</td>
</tr>
    </tbody>
    </table>
      <p></br></p>
      <p style="font-size: 9px">
      <u>DREAMHOME - Flandernstraße 101 - 73732 Esslingen</u>
    </p>
    <p>
      ${scs.tenantName} </br>
      Apartment:  ${scs.apartNo} </br>
      ${scs.street} </br>
      ${scs.zip} ${scs.city}
    </p>
    </header>
    <body>
    <table style="width: 100%">
      <tbody>
        <tr style="font-size: 14px">
          <td style="width: 50%">
            Betriebskostenabrechnung ${scsId.substring(0, 4)}
          </td>
          <td style="text-align: right; width: 50%;">
              ${getCurrentDate()}
          </td>
        </tr>
      </tbody>
    </table>
    <p><span>Sehr geehrte/r Herr/Frau ${scs.tenantName},</span></p>
    <p>
      <span 
        >hiermit &uuml;bersenden wir Ihnen die Betriebskostenabrechnung f&uuml;r das Jahr ${scsId.substring(0, 4)}.
        Nachforderungen &uuml;berweisen Sie bitte innerhalb 14 Tage auf das Ihnen
        bekannte Konto.&nbsp;</span
      >
    </p>
    <p><span >Ihr DreamHome Team</span></p>
    <table style="width: 100%">
      <thead>
        <tr class="table-header">
          <th scope="col" style="width: 40%">Betriebskosten</th>
          <th scope="col" style="width: 30%"></th>
          <th scope="col" style="width: 10%">Betrag</th>
          <th scope="col" style="width: 20%">Umlageart</th>
        </tr>
      </thead>
      <tbody>
        <tr class="table-row">
          <td>a) Wasserversorgung</td>
          <td></td>
          <td class="table-number">${typeAmountMap['Wasser'].toFixed(2)}</td>
          <td>Personenzahl</td>
        </tr>
        <tr class="table-row table-highlight">
          <td>b) Entwässerung</td>
          <td></td>
          <td class="table-number">${typeAmountMap['Entwässerung'].toFixed(2)}</td>
          <td>Personenzahl</td>
        </tr>
        <tr class="table-row">
          <td>c) Allgemeiner Stromverbrauch</td>
          <td></td>
          <td class="table-number">${typeAmountMap['Strom'].toFixed(2)}</td>
          <td>Personenzahl</td>
        </tr>
        <tr class="table-highlight">
          <td>d) Müllgebühren</td>
        </tr>
        <tr class="table-highlight">
          <td></td>
          <td>öffentliche Müllabfuhr</td>
          <td class="table-number">${typeAmountMap['MüllNichtÖff'].toFixed(2)}</td>
          <td>Behälter</td>
        </tr>
        <tr class="table-row table-highlight">
          <td></td>
          <td>nicht öffentliche Müllabfuhr</td>
          <td class="table-number">${typeAmountMap['MüllÖffentlich'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr>
          <td>e) Straßenreinigungsgebühren</td>
        </tr>
        <tr>
          <td></td>
          <td>öffentliche Straßenreinigung</td>
          <td class="table-number">${typeAmountMap['StraßenreinigungÖff'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr>
          <td></td>
          <td>Winterdienst</td>
          <td class="table-number">${typeAmountMap['Winterdienst'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr class="table-row">
          <td></td>
          <td>Niederschlagswassergebühr</td>
          <td class="table-number">${typeAmountMap['Niederschlagsentw'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr class="table-row table-highlight">
          <td>f) Grundsteuern</td>
          <td></td>
          <td class="table-number">${typeAmountMap['Grundsteuern'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr>
          <td>g) Kosten der Sach- und Haftpflichtversicherung</td>
        </tr>
        <tr>
          <td></td>
          <td>Feuer/Leitungswasser/Sturm</td>
          <td class="table-number">${typeAmountMap['Feuer_LWasser_Sturm'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr>
          <td></td>
          <td>Glasversicherung</td>
          <td class="table-number">${typeAmountMap['Glasversicherung'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr>
          <td></td>
          <td>allgem. Haftpflicht</td>
          <td class="table-number">${typeAmountMap['allgem. Haftpflicht'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr class="table-row">
          <td></td>
          <td>Gewässerschadenhaftpflicht</td>
          <td class="table-number">${typeAmountMap['Gewässerhaftpflicht'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr class="table-row table-highlight">
          <td>
            h) Kosten der Schornsteinreinigung<br />
            incl. Abgaswegeprüfung und CO-Messung <br />Thermenreinigung
          </td>
          <td></td>
          <td class="table-number">${typeAmountMap['Schornsteinreinigung'].toFixed(2)}</td>
          <td>Einzelabr.</td>
        </tr>
        <tr class="table-row">
          <td>i) Heizung und Warmwasser</td>
          <td></td>
          <td class="table-number">${typeAmountMap['Heizung_Warmwasser'].toFixed(2)}</td>
          <td>Personenzahl</td>
        </tr>
        <tr class="table-row table-highlight">
          <td>j) Gemeinschaftsantenne/Breitband</td>
          <td></td>
          <td class="table-number">${typeAmountMap['Breitband'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr class="table-row">
          <td>k) Hauswart</td>
          <td></td>
          <td class="table-number">${typeAmountMap['Hauswart'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr class="table-row table-highlight">
          <td>l) Kosten der Hausreinigung</td>
          <td></td>
          <td class="table-number">${typeAmountMap['Hausreinigung'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr class="table-row">
          <td>m) Aufzug</td>
          <td></td>
          <td class="table-number">${typeAmountMap['Aufzug'].toFixed(2)}</td>
          <td>Personenzahl</td>
        </tr>
        <tr class="table-row table-highlight">
          <td>n) Gartenpflege</td>
          <td></td>
          <td class="table-number">${typeAmountMap['Gartenpflege'].toFixed(2)}</td>
          <td>Wohnfläche</td>
        </tr>
        <tr>
          <td></td>
        </tr>
        <tr class="table-row">
          <td>Summe</td>
          <td></td>
          <td class="table-number">${totalAmount}</td>
          <td></td>
        </tr>
        <tr>
          <td></td>
        </tr>
        <tr>
          <td>Vorauszahlungen:</td>
          <td></td>
          <td class="table-number">${paid}</td>
          <td></td>
        </tr>
        <tr class="table-sum">
          <td><b>Nachzahlung:</b></td>
          <td></td>
          <td class="table-number"><b>${toPay}</b></td>
          <td>€</td>
        </tr>
      </tbody>
    </table>
    <p></br></p>
    </body>
    <footer style="border-top: 1px solid #b4d3ed;
    color: #8abde2;
    width: 100%;">
        <p>IBAN: DE02 6005 0101 0002 0343 04 </br>
            BIC: SOLADEST600 </br>
            Landesbank Baden-Württemberg </br></p>
    </footer>
  </div>
  `
}

async function retrieveSCSData(scsId) {
    try {
        const scss = await getScsDetails(scsId);
        const scs = scss[0];
        if (scs && scs.hasOwnProperty('tenantName')) {
            computeScsData(scs);

            console.log(`scs: ${scs}`)

            return scs;
        } else {
            throw new Error('Invalid SCS data');
        }
    } catch (error) {
        console.error(error);
    }
}


async function retrieveScOfScs(scsId) {
    try {
        return await getScofScss(scsId)

    } catch (error) {
        console.error(error)
    }
}

function getCurrentDate() {
    const currentDate = new Date();
    const day = String(currentDate.getDate()).padStart(2, '0');
    const month = String(currentDate.getMonth() + 1).padStart(2, '0');
    const year = currentDate.getFullYear();

    return `${day}.${month}.${year}`;
}

function computeScsData(scs) {
    const serviceTypes = ["Wasser", "Entwässerung", "Strom", "MüllÖffentlich", "StraßenreinigungÖff",
        "Grundsteuern", "Feuer_LWasser_Sturm", "Glasversicherung", "allgem. Haftpflicht", "Gewässerhaftpflicht",
        "Schornsteinreinigung", "Heizung_Warmwasser", "Breitband", "Hauswart", "Hausreinigung", "Aufzug", "Gartenpflege",
        "MüllNichtÖff", "Winterdienst", "Niederschlagsentw"];
    const serviceTypeAmountMap = {};

    for (const type of serviceTypes) {
        serviceTypeAmountMap[type] = 0;
    }

    if (scs && Array.isArray(scs)) {
        for (const sc of scs) {
            const {Type, Amount} = sc;

            if (serviceTypeAmountMap.hasOwnProperty(Type)) {
                serviceTypeAmountMap[Type] += Amount;
            }
        }
    }

    return serviceTypeAmountMap;
}

function getTotalAmount(typeAmountMap) {
    let totalAmount = 0;

    for (const type in typeAmountMap) {
        if (typeAmountMap.hasOwnProperty(type)) {
            totalAmount += typeAmountMap[type];
        }
    }

    return totalAmount;
}