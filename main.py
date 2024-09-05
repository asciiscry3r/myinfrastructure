import asyncio
import telegram
import pacman, json
import socket
import asyncio
from pyboinc import init_rpc_client


IP_BOINC = "127.0.0.1"
PASSWORD_BOINC = "cc304e522c2b6ebc206a17fd6150f1ac"


# {'id': 'acl', 'version': '2.3.1-3', 'upgradable': False, 'installed': True}
def get_values(lst):
    result = []
    for dictionary in lst:
        print(dictionary)
        dict = {}
        dict['name'] = dictionary['id']
        dict['upgradable'] = dictionary['upgradable']
        # {'id': 'zstd', 'upgradable': False}
        print(dict)
        name,upgradable = dict.values()
        if upgradable:
            print(name)
            print(upgradable)
            result.append(name)


    if result != []:
        return result
    else:
        result = 'none'
    return result


def get_boinc_status(results):
    result = []
    # results = await rpc_client.get_results()
    for result in results:
        name,project_url = result.values()
        # print(active_task_state) # .translate({ord(i): None for i in "'{}[]"}))
        print(name)
        print(project_url)
        # result.append  cat /var/run/pppd2.tdb


async def main():
    bot = telegram.Bot("5986905443:AAGd0p5vUoA0a40D3_mOp3HuHX8t1DLCYG0")
    # pacman.refresh() from root
    list = json.loads(json.JSONEncoder().encode(pacman.get_installed()))
    dict = json.dumps(pacman.get_installed())
    dict = json.loads(dict)
    rpc_client = await init_rpc_client(IP_BOINC, PASSWORD_BOINC)
    results = await rpc_client.get_results()
    hostname =  socket.gethostname()
    telegram_message = f"{hostname} is upgradable: {get_values(dict)}".translate({ord(i): None for i in "'[]"})
    async with bot:
        await bot.send_message(text=telegram_message, chat_id='-991702195')

    #get_boinc_status(results)

    #telegram_message = f"{hostname} have {results_d}"
    #async with bot:
    #    await bot.send_message(text=telegram_message, chat_id='-991702195')


if __name__ == '__main__':
    asyncio.run(main())


# Router Internet Ethernet II, Src: EdimaxTe_22:9f:b4 (08:be:ac:22:9f:b4), Dst: Solarfla_08:d7:0c (00:0f:53:08:d7:0c) 0x00008864
# Hack...Piracy Ethernet II, Src: HpnSuppl_e9:39:b1 (00:1d:b3:e9:39:b1), Dst: HewlettP_09:13:a6 (09:00:09:09:13:a6)
# Hack...Piracy Ethernet II, Src: Tp-LinkT_c5:cd:bf (ec:08:6b:c5:cd:bf), Dst: IPv6mcast_01:00:02 (33:33:00:01:00:02)
# Hack...Piracy Ethernet II, Src: HpnSuppl_e9:39:b1 (00:1d:b3:e9:39:b1), Dst: LLDP_Multicast (01:80:c2:00:00:0e) 0x000088b7
# 20 8-22 * * * /usr/bin/pacman -Syy
