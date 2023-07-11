# Azure Disk Storage

Azure Disk Storage, dat fungeert als een virtuele harde schijf in de cloud, kan zowel het besturingssysteem (OS disk) als gegevens (Data disk) huisvesten. Er zijn twee varianten beschikbaar: Unmanaged Disks, die kostenefficiënt zijn maar zelfbeheer vereisen, inclusief het onderhoud van een Storage Account, en Managed Disks, die eenvoudiger in beheer zijn en de mogelijkheid bieden om gedeeld te worden tussen meerdere virtuele machines. Back-ups voor Managed Disks kunnen efficiënt worden gemaakt via incrementele snapshots, die alleen de wijzigingen sinds de laatste snapshot vastleggen, terwijl Unmanaged Disks traditionele snapshots gebruiken.

## Key-terms
- Resource group
- Storage Area Network (SAN)
- Snapshot
- Azure Disk Storage
- Storage account -A Storage Account is a "serverless storage" to store data. You are able to access the data without running a VM from internet and/or VMs in Azure. 
- Data Disk - A data disk is always attached to a VM. You can't access the data on the data disk directly from internet.


## Opdracht
### Gebruikte bronnen
- https://learn.microsoft.com/en-us/azure/virtual-machines/disks-shared
- https://www.youtube.com/watch?v=u8qtTNorRts
- https://learn.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal?tabs=ubuntu

### Ervaren problemen
Kon de drive niet koppelen aan de 2e VM. Na een tijdje stoeien deze optie gezien: `Enable shared disk`
De drive is gemount in beide vm's, maar bestanden aangemaakt in de VM1 worden pas na vele minuten weergegeven in VM2. Daardoor leek het niet te werken.


### Resultaat
2 Virtual Machines aangemaakt genaamd `VM-kaman-A` en `VM-kaman-B`

Met beide ingelogd met ssh:

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-07_screen01.png)


Azure management disk aangemaakt genaamd `SharedDisk-Kaman`

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-07_screen02.png)

Enable shared disk.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-07_screen03.png)


Koppel deze disk bij beide VM's: VM > Disks > "Attach existing disk" 

De disk moet ge-mount worden in de Ubuntu VM.
`sudo blkid -f` om te zien of de disk wordt herkend en wat device name is.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-07_screen04.png)

Mijn device is `sdc` van 1TB groot

De schijf is nog niet geformatteerd. Formatteren met ext4:

`sudo mkfs -t ext4 /dev/sdc`

Mount deze partitie aan een nieuwe directory in beide VM's: 
```
sudo mkdir /media/azureshareddisk
sudo mount /dev/sdc /media/azureshareddisk
```

Een aantal files aangemaakt in VM1 en zijn **15 minuten** later te zien in VM2. 

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-07_screen05.png)


Snapshot aangemaakt: Disk > Create snapshot.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-07_screen06.png)

Nieuwe disk aangemaakt met daarin de snapshot.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-07_screen07.png)

De vorige stappen herhaald om deze te mounten in de VM.
1. Deze disk werd herkend als `/dev/sdd`
2. Nieuwe map aangemaakt en `sdd` gemount aan deze map.
3. Het mounten is gelukt en de bestanden werden weergegeven na **10 minuten** wachten.