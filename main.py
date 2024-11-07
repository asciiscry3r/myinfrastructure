import asyncio
import telegram
import pacman, json
import socket
import asyncio
from datetime import datetime
from pyboinc import init_rpc_client


IP_BOINC = "127.0.0.1"
PASSWORD_BOINC = ""


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
    bot = telegram.Bot("")
    # pacman.refresh() from root
    list = json.loads(json.JSONEncoder().encode(pacman.get_installed()))
    dict = json.dumps(pacman.get_installed())
    dict = json.loads(dict)
    rpc_client = await init_rpc_client(IP_BOINC, PASSWORD_BOINC)
    results = await rpc_client.get_results()
    hostname =  socket.gethostname()
    today_date_time = datetime.now()
    today_date_time = today_date_time.strftime("%d/%m/%Y %H:%M")
    telegram_message = f"Hi, {today_date_time}, this host - {hostname} have this upgrades: {get_values(dict)}".translate({ord(i): None for i in "'[]"})
    async with bot:
        await bot.send_message(text=telegram_message, chat_id='-991702195')

    #get_boinc_status(results)

    #telegram_message = f"{hostname} have {results_d}"
    #async with bot:
    #    await bot.send_message(text=telegram_message, chat_id='-991702195')


if __name__ == '__main__':
    asyncio.run(main())

