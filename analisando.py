# Usuários que fizeram mais de uma compra e pediram chargeback

import pandas as pd

transactional = pd.read_csv("case/transactional-sample.csv")

filtro1 = (transactional["user_id"].duplicated(keep=False) == True) & (transactional["has_cbk"] == True)
print(transactional[filtro1])

# Usuários que fizeram mais de uma compra em dispositivos diferentes e pediram chargeback

filtro2 = (transactional["user_id"].duplicated(keep=False) == True) & (transactional["device_id"].duplicated(keep=False) == False) & (transactional["has_cbk"] == True)
print(transactional[filtro2].dropna())

# Usuários que fizeram mais de uma compra com cartões diferentes e pediram chargeback

filtro3 = (transactional["user_id"].duplicated(keep=False) == True) & (transactional["card_number"].duplicated(keep=False) == False) & (transactional["has_cbk"] == True)
print(transactional[filtro3])
