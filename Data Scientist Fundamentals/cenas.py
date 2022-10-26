import pandas as pd


def importipma(file_name):
    for k in [1, 2, 3]:
        ipma_data = pd.read_excel(file_name, sheet_name=k)
        ipma_data.set_index(ipma_data.columns[0], inplace=True)
        ipma_data = ipma_data.loc["1986":"2022"]

        ipma_data = ipma_data.mean(axis=1)
        ipma_data_final = (
            ipma_data if k == 1 else pd.concat([ipma_data_final, ipma_data], axis=1)
        )
    return ipma_data_final


string_de_cenas = "Coisas %s".format(1) + "cenas"
