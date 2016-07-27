# Using latest Oracle Linux image as base
FROM oraclelinux:6.8

# Install Packages required for ftp
RUN yum install -y vsftpd && yum clean all

#configure vsftpd.conf

RUN echo "background=NO" >> /etc/vsftpd/vsftpd.conf && sed -i 's/anonymous_enable=YES/anonymous_enable=NO/g' /etc/vsftpd/vsftpd.conf

# Useradd
RUN useradd -ms /bin/bash deiva  && echo "deiva" |passwd --stdin deiva

# startup
CMD ["vsftpd","/etc/vsftpd/vsftpd.conf"]
EXPOSE 21/tcp
